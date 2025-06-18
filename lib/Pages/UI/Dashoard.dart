import 'package:flutter/material.dart';

class MyDashboardBuild extends StatelessWidget {
  const MyDashboardBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyDashboard();
  }
}

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
  //create state
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF76BD9C),
      appBar: AppBar(title: Text('MyDashboad Page')),
      body: Container(),
    );
  }
}




//stateless widget 
//desn't not Edit 