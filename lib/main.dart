import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vividdrive/Component/buttomNavbar.dart';
import 'package:vividdrive/screens/SplashScreen/splashscreen.dart';
import 'package:vividdrive/screens/auth/forgetpassword.dart';
import 'package:vividdrive/screens/auth/loginScreen.dart';
import 'package:vividdrive/screens/auth/signup_screen.dart';
import 'package:vividdrive/screens/auth/verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Vivid Drive',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/Signup': (context) => SignUpScreen(),
        '/nav': (context) => const Navbar(), // Replace with your home screen
        '/forgetpassword': (context) => ForgotPasswordScreen(),
        '/Verifyscreen': (context) => VerificationScreen(),
      },
    );
  }
}
