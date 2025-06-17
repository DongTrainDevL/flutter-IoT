import 'package:flutter/material.dart';



class RegisterUiForm extends StatelessWidget {
  const RegisterUiForm({super.key});
  
  get firstNameController => null;

  @override
  Widget build(BuildContext context) {
    return const Register();
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _fromKey = GlobalKey<FormState>() ;
  //Create input 
  final firstNameController = TextEditingController() ;
  final lastNameController = TextEditingController() ;
  final usernameController = TextEditingController() ;
  final emailController = TextEditingController() ;
  final passwordController = TextEditingController() ;
  final confPasswordController = TextEditingController() ;


  @override
  void dispose(){
    //clear Controller right wiget the deleted
    firstNameController.dispose() ;
    lastNameController.dispose() ;
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confPasswordController.dispose(); 
    super.dispose();

  }

  //submibVoid 
  void _submitForm() {
    if (_fromKey.currentState!.validate()) {
       print("FirstName : ${firstNameController.text}") ;
       print("LastName : ${lastNameController.text}") ;
       print("Username : ${usernameController.text}") ;
       print("Email : ${emailController.text}") ;
       print("Password : ${passwordController.text}") ;
       print("ConfirmPassword : ${confPasswordController.text}") ;

       firstNameController.clear() ;
       lastNameController.clear() ;
       usernameController.clear();
       emailController.clear() ;
       passwordController.clear() ;
       confPasswordController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:Color(0xFF225D47),
      body:Center( 
        child : SingleChildScrollView( 
          padding: const EdgeInsets.all(24) , 
           child : Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Image.asset('assets/icons/logo-flid-tech.png' ,
                width:145,
                height: 138, ),
                const SizedBox(height: 10,),
                const Text('Register', style : TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color:Color(0xFFFFFFFF)) 
               ),

               SizedBox(height: 25,) ,

               SizedBox( 
                  width: 285 ,
                  height: 45,
                child : TextField( 
                  controller: firstNameController, 
                  decoration: InputDecoration( 
                    hintText: 'FirstName :' ,
                    prefixIcon : const Icon(Icons.person_2_outlined) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),

                SizedBox(height: 25,) ,

                SizedBox( 
                  width: 285 ,
                  height: 46,
                child : TextField( 
                  controller: lastNameController, 
                  decoration: InputDecoration( 
                    hintText: 'LastName : ' ,
                    prefixIcon : const Icon(Icons.person_2_outlined) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),

                SizedBox(height: 25,) ,

                SizedBox( 
                  width: 285 ,
                  height: 46,
                child : TextField( 
                  controller: usernameController, 
                  decoration: InputDecoration( 
                    hintText: 'Username : ' ,
                    prefixIcon : const Icon(Icons.person_2_outlined) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),
                SizedBox(height: 25,) ,

                SizedBox( 
                  width: 285 ,
                  height: 46,
                child : TextField( 
                  controller: emailController, 
                  decoration: InputDecoration( 
                    hintText: 'Email :' ,
                    prefixIcon : const Icon(Icons.email_outlined) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),
                SizedBox(height: 25,) ,

                SizedBox( 
                  width: 285 ,
                  height: 46,
                child : TextField( 
                  controller: passwordController, 
                  decoration: InputDecoration( 
                    hintText: 'Password :' ,
                    prefixIcon : const Icon(Icons.lock_clock) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),
                SizedBox(height: 25,) ,

                SizedBox( 
                  width: 285 ,
                  height: 46,
                child : TextField( 
                  controller: confPasswordController, 
                  decoration: InputDecoration( 
                    hintText: 'ConfirmPassword : ' ,
                    prefixIcon : const Icon(Icons.lock_clock) ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),


                    ),
                    //background TextInput button
                    filled : true ,
                    fillColor: Color(0xFFFFFFFF) ,
                  ),
                ),
                ),
                SizedBox(height: 25,) , 
                
                SizedBox( 
                  width: 300, 
                  height: 64,
                child : ElevatedButton(onPressed: () { 
                style : ElevatedButton.styleFrom( 
                  backgroundColor: Color(0xFFFFFFFF) ,
                  minimumSize: const Size.fromHeight(50) ,
                  shape:RoundedRectangleBorder( 
                    borderRadius: BorderRadiusGeometry.circular(60),
                  ),
                );
                }, child: const Text('Register', style:TextStyle(fontSize: 16 , color:Color(0xFF76BD9C)) 
              ),
            ),


                ),
              
            ]
            
           ) ,

        ),

      ),
    );
  
    
  }
}



