import 'package:first_project/main.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: screenWidth,
              child: Form(
                //autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 67),

                    Image.asset(
                      "assets/images/logo2.png",
                      width: 72,
                      height: 72,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Welcome to Lafyuu",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Sign in to Continue",
                      style: TextStyle(
                          color: Color(0xFF9098B1), fontWeight: FontWeight.w400),
                    ),

                    const SizedBox(height: 15),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        //border:
                        prefixIcon: Icon(Icons.email_outlined,),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFEBF0FF),
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF40BFFF),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      validator: (value){
                        final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if(value.isEmpty){
                          return "Please enter email";
                        }else if(emailValid == false){
                          return "Enter Correct Email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      obscureText: passToggle,
                      controller: passController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          child: passToggle
                              ?Icon(Icons.visibility)
                              :Icon(Icons.visibility_off),
                          onTap: (){
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                        ),
                        prefixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFEBF0FF),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF40BFFF),
                            )),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      validator: (value){
                        RegExp validPass =
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else {
                          if (!validPass.hasMatch(value)) {
                            return 'Your password is not correct';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Signed In Successfully')),
                          );
                        }
                      },
                      child: Text("Sign in"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(screenWidth, 50),
                        backgroundColor: Color(0xFF40BFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            endIndent: 15,
                            color: Color(0xFFEBF0FF),
                          ),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9098B1)),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent: 15,
                            color: Color(0xFFEBF0FF),
                          ),
                        ),
                      ],
                    ), // divider

                    const SizedBox(height: 18),

                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset("assets/images/Google.png"),
                      label: Text(
                        "Login With Google",
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9098B1)),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(screenWidth, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.facebook_rounded),
                      label: Text(
                        "Login With Facebook",
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9098B1)),
                      ),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(screenWidth, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Paswword?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xFF40BFFF)),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have a account?  ",
                          style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return RegisterScreen();
                              }),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xFF40BFFF)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}