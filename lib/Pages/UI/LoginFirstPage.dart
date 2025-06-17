import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:flutter_application_1/layout/LoginPage.dart';
import 'package:flutter_application_1/layout/RegisterPage.dart';

class LoginFirstPage extends StatefulWidget {
  const LoginFirstPage({super.key});

  @override
  State<LoginFirstPage> createState() => _LoginFirstPageState();
}

class _LoginFirstPageState extends State<LoginFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

//state less ที่ไม่สามารถเปลี่ยนแปลงค่าได้

class LoginPageFirstUi extends StatelessWidget {
  const LoginPageFirstUi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
        backgroundColor: Color(0xFF225D47) ,
        body: Center( 
          child: SingleChildScrollView(  
            padding: const EdgeInsets.all(24) , 
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Image.asset('assets/icons/logo-flid-tech.png' ,
                width: 145,
                height: 138,),
                const SizedBox(height: 20,) ,
                const Text('Login', style : TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color:Color(0xFFFFFFFF)) 
                
                ),
                //  การกำหนดความห่างในรูปแบบแนวตั้ง username 
                const SizedBox(height: 30,) ,
                
                //  การกำหนดความห่างในรูปแบบแนวตั้ง password 
                
                const SizedBox(height:  40,), 
                SizedBox(
                  width: 250,
                  height: 55,

                  child : ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement( 
                      context, 
                      MaterialPageRoute(builder: (context) => const Loginpage()) ,
                    );
                  },
                 
                 style:ElevatedButton.styleFrom( 
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: const Size.fromHeight(50) ,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(60),
                  ),
                 ), child: const Text('Login' , style : TextStyle(fontSize: 16 , color:Color(0xFF76BD9C)),) 
                    
                ),

                ),
                const SizedBox(height:  40 ),
                SizedBox(
                  width: 250,
                  height: 55,
                  //laddingpage RegisterPage
                  child: ElevatedButton(onPressed:  () { 
                    Navigator.pushReplacement(context,  
                    MaterialPageRoute(builder: (context) => const Register())
                    );

                  }, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Color(0xFF76BD9C) ,
                    minimumSize: const Size.fromHeight(50) ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: const Text('Sign Up',style:TextStyle(fontSize: 16, color:Color(0xFFFFFFFF)) ,)
                  )
                ),
                
                
              ],
            ),
          ),
        )
    );
  }
}
