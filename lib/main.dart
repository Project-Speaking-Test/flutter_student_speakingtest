import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/interfaces/completepage_interface.dart';
import 'interfaces/loginpage_interface.dart';
import 'interfaces/homepage_interface.dart';
import 'interfaces/testresultpage_interface.dart';
import 'interfaces/registerpage_interface.dart';
import 'interfaces/resultpage_interface.dart';
import 'interfaces/testpage_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginpage',
      routes: {
        HomePage.nameRoute : (context) => const HomePage(),
        LoginPage.nameRoute : (context) => const LoginPage(),
        RegisterPage.nameRoute : (context) => const RegisterPage(),
        CompletePage.nameRoute : (context) => const CompletePage(),
        ResultPage.nameRoute : (context) => ResultPage(),
        TestPage.nameRoute : (context) => const TestPage(),
        TestResultPage.nameRoute : (context) => const TestResultPage()
      },
      home: CompletePage()
    );
  }
}