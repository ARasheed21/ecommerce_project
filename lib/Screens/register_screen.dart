import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 67,
                  ),

                  Image.asset(
                    "assets/images/logo2.png",
                    width: 72,
                    height: 72,
                  ),

                  // image
                  const SizedBox(height: 10),
                  Text(
                    "Let’s Get Started",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Create an new account",
                    style: TextStyle(
                        color: Color(0xFF9098B1), fontWeight: FontWeight.w400),
                  ),

                  const SizedBox(height: 18),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
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
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined),
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
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
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
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password Again",
                      border: InputBorder.none,
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
                    ),
                  ),

                  const SizedBox(height: 18),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Sign up"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF40BFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fixedSize: Size(screenWidth, 50)),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have a account?  ",
                        style: TextStyle(
                            color: Color(0xFF9098B1),
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }),
                          );
                        },
                        child: Text(
                          "Sign In",
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
        ));
  }
}