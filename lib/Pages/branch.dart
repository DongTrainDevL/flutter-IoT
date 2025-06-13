import 'package:flutter/material.dart';

class Branch {
  final int id;
  String name;
  bool isActive;

  Branch({required this.id, required this.name, this.isActive = true});
}

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  final List<Branch> _branches = [];
  final TextEditingController _nameController = TextEditingController();
  int _nextId = 1;

  void _addBranch() {
    if (_nameController.text.trim().isEmpty) return;

    setState(() {
      _branches.add(Branch(id: _nextId++, name: _nameController.text.trim()));
      _nameController.clear();
    });
  }

  void _editBranch(Branch branch) {
    final TextEditingController editController =
        TextEditingController(text: branch.name);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Branch'),
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(labelText: 'Branch Name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                branch.name = editController.text.trim();
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _removeBranch(Branch branch) {
    setState(() {
      _branches.remove(branch);
    });
  }

  void _toggleStatus(Branch branch) {
    setState(() {
      branch.isActive = !branch.isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Created Branch')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field with button (responsive)
            LayoutBuilder(
              builder: (context, constraints) {
                return constraints.maxWidth < 400
                    ? Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Branch Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _addBranch,
                              child: const Text('Add'),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Branch Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _addBranch,
                            child: const Text('Add'),
                          ),
                        ],
                      );
              },
            ),
            const SizedBox(height: 20),

            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Expanded(flex: 1, child: Center(child: Text('No'))),
                  Expanded(flex: 3, child: Center(child: Text('Branch Name'))),
                  Expanded(flex: 2, child: Center(child: Text('Status'))),
                  Expanded(flex: 2, child: Center(child: Text('Actions'))),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Branch List
            Expanded(
              child: _branches.isEmpty
                  ? const Center(child: Text("No branches added yet."))
                  : ListView.builder(
                      itemCount: _branches.length,
                      itemBuilder: (context, index) {
                        final branch = _branches[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Center(child: Text('${index + 1}'))),
                                Expanded(
                                    flex: 3,
                                    child: Center(child: Text(branch.name))),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Switch(
                                      value: branch.isActive,
                                      onChanged: (_) =>
                                          _toggleStatus(branch),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () =>
                                            _editBranch(branch),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () =>
                                            _removeBranch(branch),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
