import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/UI/Dashoard.dart';
import 'package:flutter_application_1/Pages/UI/LoginFirstPage.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
   final usernameController = TextEditingController() ;
   final passwordController = TextEditingController() ; 

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose() ;
    super.dispose();
  }

  void _handleLogin() {
    final username = usernameController.text ;
    final password = passwordController.text; 

    usernameController.clear() ;
    passwordController.clear() ;
    // debug checking password
    debugPrint("username : ${username} , Password: ${password}") ;
  }



  @override
  Widget build(BuildContext context) {
    return LoginView( 
      usernameController: usernameController ,
      passwordController: passwordController ,
      onLogin: _handleLogin,
    );
  }
}


class LoginView extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController ;
  final VoidCallback onLogin;
  const LoginView({super.key , 
    required this.usernameController,
    required this.passwordController, 
    required this.onLogin ,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
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
                SizedBox( 
                  width: 300 ,
                  height: 60,
                child : TextField( 
                  controller: usernameController, 
                  decoration: InputDecoration( 
                    hintText: 'Username' ,
                    prefixIcon : const Icon(Icons.person_2_outlined) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),
                //  การกำหนดความห่างในรูปแบบแนวตั้ง password 
                const SizedBox(height: 25 ,),
                SizedBox( 
                  width: 300 ,
                  height: 60,

                child : TextField( 
                 controller: passwordController, 
                 decoration: InputDecoration( 
                  hintText: "Password" ,
                  
                  prefix:Icon(Icons.lock_open) ,
                  // contentPadding: EdgeInsets.symmetric(vertical: 15 , horizontal: 10),
                  border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(60) ,
                  ),    
                  //background InputText    
                  filled: true ,
                  fillColor: Color(0xFFFFFFFF),             
                 ),
                ) ,
                  

                ),
                const SizedBox(height:  40,), 
                SizedBox(
                  width: 250,
                  height: 55,

                  child : ElevatedButton(
                  onPressed:  (){ 
                    Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context) => const MyDashboard() )
                    );
                  } ,
                 
                 style:ElevatedButton.styleFrom( 
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: const Size.fromHeight(50) ,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(60),
                  ),
                 ), child: const Text('Login' , style : TextStyle(fontSize: 16 , color:Color(0xFF76BD9C)),) 
                    
                ),

                ),

                const SizedBox(height: 30),
                //backhome
                SizedBox(
                  width: 250,
                  height: 55,

                  child : ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement( 
                      context, 
                      MaterialPageRoute(builder: (context) => const LoginPageFirstUi()) ,
                    );
                  },
                 
                 style:ElevatedButton.styleFrom( 
                  backgroundColor: Color(0xFF76DB9C),
                  minimumSize: const Size.fromHeight(50) ,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(60),
                  ),
                 ), child: const Text('Home' , style : TextStyle(fontSize: 16 , color:Color(0xFFFFFFFF)),) 
                  
                 ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

  


