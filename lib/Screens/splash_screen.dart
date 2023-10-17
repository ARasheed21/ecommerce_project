
import 'package:first_project/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
          () {
            getToken();
      },
    );
  }

  void getToken ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('access-token');

    if(token != null && token.isNotEmpty){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40bFFF),
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 72,
          width: 72,
        ),
      ),
    );
  }
}