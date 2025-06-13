import 'package:flutter/material.dart';

class ManageBranch extends StatelessWidget {
  const ManageBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManageBranchPage();
  }
}

class ManageBranchPage extends StatefulWidget {
  const ManageBranchPage({super.key});

  @override
  State<ManageBranchPage> createState() => _ManageBranchPageState();
}

class _ManageBranchPageState extends State<ManageBranchPage> {
  bool isEditEnabled = false;
  bool isActive = false;
  double scoreRange = 50;
  String monitorName = 'Smart Monitor';

  String selectedGroup = 'SmartFarm01 Water Level [volt]';
  String selectedDevice = 'IOT01';
  String selectedType = 'Analogin';
  String selectedData = 'DATA01';

  List<String> groupList = [
    'SmartFarm01 Water Level [volt]',
    'GreenHouse Humidity [%]',
    'Factory01 Air Quality [ppm]'
  ];
  List<String> deviceList = ['IOT01', 'IOT02', 'HQ'];
  List<String> typeList = ['Analogout', 'Analogin', 'Digitalout', 'Digitalin'];
  List<String> dataList = ['DATA01', 'DATA02', 'TEMP01'];

  void _editBanner() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Banner"),
        content: const Text("Banner edit dialog here."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ManageBranch API')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Monitor ID: 12345", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Text("Enable Edit: "),
                    Switch(
                      value: isEditEnabled,
                      onChanged: (val) {
                        setState(() {
                          isEditEnabled = val;
                        });
                      },
                    ),
                  ],
                ),

                if (isEditEnabled) ...[
                  const SizedBox(height: 10),
                  const Divider(),

                  /// Group Selector
                  Row(
                    children: [
                      const Text("Group: "),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedGroup,
                          items: groupList
                              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedGroup = value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Device Selector
                  Row(
                    children: [
                      const Text("Device: "),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedDevice,
                          items: deviceList.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                          onChanged: (value) {
                            setState(() => selectedDevice = value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Type Selector
                  Row(
                    children: [
                      const Text("Type: "),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedType,
                          items: typeList.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                          onChanged: (value) {
                            setState(() => selectedType = value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Data Selector
                  Row(
                    children: [
                      const Text("Data: "),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedData,
                          items: dataList.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                          onChanged: (value) {
                            setState(() => selectedData = value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Banner Button
                  Row(
                    children: [
                      const Text("Banner: "),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _editBanner,
                        child: const Text("Edit"),
                      ),
                    ],
                  ),

                  const Divider(),
                  const SizedBox(height: 10),

                  /// Monitor Name
                  const Text("Monitor Name:"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter monitor name',
                    ),
                    onChanged: (val) {
                      setState(() => monitorName = val);
                    },
                  ),

                  const SizedBox(height: 16),

                  /// Scored Range
                  const Text("Scored Range:"),
                  Slider(
                    value: scoreRange,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: scoreRange.round().toString(),
                    onChanged: (value) {
                      setState(() => scoreRange = value);
                    },
                  ),

                  /// Active Setting
                  Row(
                    children: [
                      const Text("Active setting: "),
                      Switch(
                        value: isActive,
                        onChanged: (val) {
                          setState(() => isActive = val);
                        },
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Handle setting logic
                      },
                      child: const Text("Setting"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {
                        // TODO: Handle remove logic
                      },
                      child: const Text("Removed"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
