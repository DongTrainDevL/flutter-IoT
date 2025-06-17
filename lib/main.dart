import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'api/device.dart';
import 'layout/mainLayout.dart' ;
import './widgets/dashboard_cart.dart' ;
import './layout/LoginPage.dart';
import './Pages/UI/LoginFirstPage.dart' ;
import './layout/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xFF225D47), 
          foregroundColor: Colors.white ,
        )
      ),

      // home: const DeviceScreen( ),
      // home : Loginpage() ,
      // home : LoginPageFirstUi() ,
      home : LoginPageFirstUi() ,
      debugShowCheckedModeBanner: false,
    
    );
  }
}

