import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/models/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import 'registerpage_interface.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

import 'homepage_interface.dart';

class LoginPage extends StatefulWidget {
  static const nameRoute = '/loginpage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  final emailController = TextEditingController();

  final passController = TextEditingController();

  // bool _isLoading = false;

  // connectLoginAPI(String email, String password) async {
  //   var body = {'email': email, 'password': password};
  //   var header = {'Content-Type': 'application/json'};
  //
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Uri url = Uri.parse('https://unudspeakingtest.com/student.php?api=login');
  //
  //   final hasilResponse =
  //       await http.post(url, body: jsonEncode(body), headers: header);
  //
  //   if (hasilResponse.statusCode == 200) {
  //     var jsonData = json.decode(hasilResponse.body);
  //     setState(() {
  //       _isLoading = false;
  //       sharedPreferences.setString('token', jsonData['token'].toString());
  //       Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
  //     });
  //   } else {
  //     print(hasilResponse.body);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: gradientBackgroundColor),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 0.05 * size.height,
                  ),
                  Image.asset(
                    'assets/img/Logo Udayana.png',
                    height: 119.45,
                    width: 104.4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "SPEAKING TEST",
                    style: headlineMain1,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 0.62 * size.height,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  )),
              // child: _isLoading
              //     ? Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     :
              child : isLoading ? Center(child : CircularProgressIndicator()) : Column(
                      children: [
                        const SizedBox(
                          height: 27,
                        ),
                        Text(
                          "Login",
                          style: headlineTitle1,
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 27),
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: headlineHint,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'userspeak@mail.com',
                                  hintStyle: hintText,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 27),
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: headlineHint,
                              ),
                              TextFormField(
                                controller: passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: '* * * * * * * * * * * ',
                                  hintStyle: hintText,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 27),
                          width: 10000,
                          child: TextButton(
                            onPressed: () async {
                              isLoading = true;
                              await loginUser( emailController.text, passController.text);
                              SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
                              if(sharedpreferences.getString('token') != null){
                                print('Klik 1');
                                isLoading =false;
                                print('Token Login Button :${sharedpreferences.getString('token')}');
                                Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
                              }else{
                                isLoading = false;
                                //toast
                              }
                            },
                            child: Text(
                              "LOGIN",
                              style: button1,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            gradient: gradientBackgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 27),
                          width: 10000,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterPage.nameRoute);
                            },
                            child: Text(
                              "Register",
                              style: button2,
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                color: borderColor,
                                width: 3,
                              )),
                        ),
                      ],
                    ),
            ),
          )
        ],
      )),
    );
  }
}
