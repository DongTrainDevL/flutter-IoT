import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  List<dynamic> _devices = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchDevices();
  }

  Future<void> _fetchDevices() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://49.0.69.152:9000/iotsf/api-flutter/device-getall.php',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _devices = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Server responded with status ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error fetching data: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device API")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) { 
                final device = _devices[index];
                return ListTile(
                  title: Text(device['item_name'] ?? 'Unknown'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ประเภท: ${device['item_type_id'] ?? '-'}'),
                      Text(
                        'สถานะ: ${device['status'] == '1' ? 'ใช้งาน' : 'ไม่ใช้งาน'}',
                      ),
                      Text('สร้างเมื่อ: ${device['createtime'] ?? '-'}'),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
