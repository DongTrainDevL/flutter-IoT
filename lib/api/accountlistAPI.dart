import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountList extends StatefulWidget {
  const AccountList({super.key});

  @override
  State<AccountList> createState() => accountlistapi();
}

class accountlistapi extends State<AccountList> {
  List<dynamic> _accountList = [];
  bool _isLoading = true;
  String? _error = '';

  //create fetch api

  Future<void> _fetchAccount() async {
    try {
      final response = await http.get(
        Uri.parse('http://49.0.69.152/iotsf/api-flutter/register-getall.php'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _accountList = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = "not found reqeust ${response.statusCode}";
          _isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _error = "Error cathing request ${err}";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("member account list ")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : ListView.builder(
              itemCount: _accountList.length,
              itemBuilder: (context, index) {
                final acountlist = _accountList[index];
                return ListTile(
                  title: Text(acountlist['user_account'] ?? 'Unknown'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('username: ${acountlist['username'] ?? '-'}'),
                      Text('name: ${acountlist['name']}'),
                      Text('email: ${acountlist['email'] ?? '-'}'),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
