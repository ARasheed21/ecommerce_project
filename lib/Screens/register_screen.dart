import 'package:first_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:first_project/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailedUnExpected) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }

            if (state is AuthDataNotValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }

            if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (_) {
                  return HomeScreen();
                },
              ), (route) => false);
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    width: screenWidth,
                    child: Form(
                      key: formKey,
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
                                color: Color(0xFF9098B1),
                                fontWeight: FontWeight.w400),
                          ),

                          const SizedBox(height: 18),

                          TextFormField(
                            controller: nameController,
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
                            controller: emailController,
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
                            validator: (value) {
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return "Please enter email";
                              } else if (emailValid == false) {
                                return "Enter Correct Email";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: "Phone",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.phone),
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
                            controller: passController,
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
                            validator: (value) {
                              RegExp validPass = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!validPass.hasMatch(value)) {
                                  return 'Your password is not valid';
                                } else {
                                  return null;
                                }
                              }
                            },
                          ),

                          const SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                      nameController.text,
                                      phoneController.text,
                                      emailController.text,
                                      passController.text,
                                    );
                              }
                            },
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
                ),
              );
            },
          ),
        ));
  }
}
