import 'package:flutter/material.dart';

class GroupManagePage extends StatefulWidget {
  @override
  _GroupManagePageState createState() => _GroupManagePageState();
}

class _GroupManagePageState extends State<GroupManagePage> {
  String? selectedGroup;
  String? selectedDevice;
  String? selectedType;
  String? selectedData;
  String dataValue = '0';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataValueController = TextEditingController(text: '0');

  @override
  void dispose() {
    _dataValueController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      bool confirm = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("ยืนยันการทำ Event"),
          content: Text("คุณแน่ใจหรือไม่ว่าจะทำ Event นี้?"),
          actions: [
            TextButton(
              child: Text("ไม่"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            ElevatedButton(
              child: Text("ใช่"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );

      if (confirm == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Event ถูกส่งสำเร็จ')),
        );
        print({
          'Group': selectedGroup,
          'Device': selectedDevice,
          'Type': selectedType,
          'Data': selectedData,
          'DataValue': dataValue,
        });
      }
    }
  }

  void _updateDataValue(int delta) {
    int current = int.tryParse(_dataValueController.text) ?? 0;
    current += delta;
    if (current < 0) current = 0;
    setState(() {
      _dataValueController.text = current.toString();
      dataValue = current.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Group Manage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: selectedGroup,
                hint: Text('เลือก Group'),
                items: ['Group A', 'Group B']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => selectedGroup = val),
                validator: (val) => val == null ? 'กรุณาเลือก Group' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedDevice,
                hint: Text('เลือก Device'),
                items: ['Device 1', 'Device 2']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => selectedDevice = val),
                validator: (val) => val == null ? 'กรุณาเลือก Device' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedType,
                hint: Text('เลือก Type'),
                items: ['Sensor', 'Actuator']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => selectedType = val),
                validator: (val) => val == null ? 'กรุณาเลือก Type' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedData,
                hint: Text('เลือก Data'),
                items: ['Temperature', 'Humidity']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => selectedData = val),
                validator: (val) => val == null ? 'กรุณาเลือก Data' : null, 
              ),
              SizedBox(height: 10),

              /// Section: Data Value + up/down buttons
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dataValueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Data Value (ตัวเลขเท่านั้น)'),
                      onChanged: (val) {
                        setState(() => dataValue = val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'กรุณากรอกค่า';
                        if (double.tryParse(val) == null) return 'กรุณากรอกตัวเลขเท่านั้น';
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_drop_up),
                        onPressed: () => _updateDataValue(1),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () => _updateDataValue(-1),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),

              ElevatedButton(
                child: Text('ยืนยัน'),
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }
}
