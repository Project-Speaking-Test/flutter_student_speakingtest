import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/constants/font.dart';
import 'package:flutter_student_speakingtest/interfaces/resultpage_interface.dart';
import 'interfaces/loginpage_interface.dart';
import 'interfaces/homepage_interface.dart';
import 'interfaces/registerpage_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: projectTextTheme
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginpage',
      routes: {
        HomePage.nameRoute : (context) => const HomePage(),
        LoginPage.nameRoute : (context) => const LoginPage(),
        RegisterPage.nameRoute : (context) => const RegisterPage(),
        ResultPage.nameRoute : (context) => const ResultPage(),
      },
      home: const LoginPage()
    );
  }
}