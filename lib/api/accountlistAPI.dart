import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountList extends StatefulWidget {
  const AccountList({super.key});

  @override
  State<AccountList> createState() => _AccountListApi();
}

class _AccountListApi extends State<AccountList> {
  List<dynamic> _accountList = [];
  bool _isLoading = true;
  String? _error = '';

  @override
  void initState() {
    super.initState();
    _fetchAccount();
  }

  Future<void> _fetchAccount() async {
    try {
      final response = await http.get(
        Uri.parse('http://49.0.69.152/iotsf/api-flutter/register-getall.php'),
      );

      print('Raw response body: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        try {
          final data = json.decode(response.body);
          setState(() {
            _accountList = data;
            _isLoading = false;
          });
          print('Parsed data: $data');
        } catch (e) {
          setState(() {
            _error = 'JSON Format Error:\n$e\n\nRaw: ${response.body}';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _error = 'Request failed: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _error = ' Error catch: $err';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Member Account List")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _error!.isNotEmpty
          ? Center(child: Text(_error!, textAlign: TextAlign.center))
          : ListView.builder(
              itemCount: _accountList.length,
              itemBuilder: (context, index) {
                final account = _accountList[index];
                return ListTile(
                  title: Text(account['username'] ?? 'Unknown'),
                  subtitle: Text('username: ${account['username']}'),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
