import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:first_project/Screens/register_screen.dart';
import 'package:first_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/cart_screen.dart';
import 'Screens/fav_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/offer_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
    runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(home: RegisterScreen()),
    );
  }
}




