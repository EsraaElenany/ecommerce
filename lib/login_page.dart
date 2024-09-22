import 'package:ecommerce/shared.dart';
import 'package:flutter/material.dart';

import 'default_text_form_filed.dart';
import 'enums.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  //var emailController =TextEditingController(text: "example@gmail.com");
  var emailController =TextEditingController(text: Shared.getString(key: SharedKeys.email));
  var passwordController =TextEditingController(text: Shared.getString(key: SharedKeys.password));

  var formKey= GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:formKey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const  Text("Login", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 45
                    ),),
                    const  SizedBox(height: 10,),
                    TextFormField(
                      validator: (value){
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)){
                          return "enter valid mail";
                        }
                        return null;
                      },
                      controller:emailController ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text("Email"),
                          suffixIcon: Icon(Icons.email),
                          //  suffix: Icon(Icons.email),
                          // prefixIcon: Icon(Icons.email),
                          // labelText: "Email",
                          hintText: "Enter your mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),


                    const  SizedBox(height: 15,),

                    TextFormField(
                      obscureText: obscureText ,
                      obscuringCharacter: "*",
                      controller:passwordController ,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text("Password"),
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              obscureText =!obscureText;

                            });
                          }, icon: obscureText?  Icon(Icons.remove_red_eye , color: Colors.grey,):
                          Icon(Icons.remove_red_eye_outlined , color: Colors.teal,)),
                          //  suffix: Icon(Icons.email),
                          // prefixIcon: Icon(Icons.email),
                          // labelText: "Email",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),  const  SizedBox(height: 15,),


                    const  SizedBox(height: 20,),

                    ElevatedButton(onPressed: (){
                      print("password is ${passwordController.text}");
                      print("email is ${emailController.text}");
                      if(formKey.currentState!.validate()){
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context)=> HomePage()),(route)=> false);
                        Shared.putString(key: SharedKeys.email, value: emailController.text);
                        Shared.putString(key: SharedKeys.password, value: passwordController.text);

                      }

                    }, child: Text("Login", style: TextStyle(fontSize: 30, color: Colors.teal),))
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
