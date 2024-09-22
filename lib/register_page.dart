import 'package:flutter/material.dart';

import 'default_text_form_filed.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController =TextEditingController();

  var phoneController =TextEditingController();

  var passwordController =TextEditingController();

  var nameController =TextEditingController();
  var addressController =TextEditingController();

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
                  const  Text("Register", style: TextStyle(
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
                    controller: nameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "please enter your name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("Name"),
                      suffixIcon: Icon(Icons.account_box_outlined),
                      //  suffix: Icon(Icons.email),
                      // prefixIcon: Icon(Icons.email),
                      // labelText: "Email",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),),
                  const  SizedBox(height: 15,),
                  DefaultTextFormFiled(
                    controller: addressController,
                    validator: (value ) {
                    if(value!.isEmpty){
                      return "please enter your address";
                    }
                    return null;
                    },
                    hint: "enter your address",
                    labelText: "Address",
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

                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value){
                      if(value!.length >11 || value.length <11){
                        return "please enter valid phone";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                    label: Text("Mobile"),
                   suffixIcon: Icon(Icons.phone),
                    //  suffix: Icon(Icons.email),
                    // prefixIcon: Icon(Icons.email),
                     // labelText: "Email",
                      hintText: "Enter your phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                  const  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){
                    print("password is ${passwordController.text}");
                    print("email is ${emailController.text}");
                    print("phone is ${phoneController.text}");
                    if(formKey.currentState!.validate()){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context)=> HomePage()),(route)=> false);

                    }

                  }, child: Text("Register", style: TextStyle(fontSize: 30, color: Colors.teal),))
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
