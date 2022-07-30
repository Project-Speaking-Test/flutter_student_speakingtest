import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/interfaces/loginpage_interface.dart';

import '../constants/color.dart';
import 'homepage_interface.dart';

class RegisterPage extends StatelessWidget {
  static const nameRoute = '/registerpage';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: backgroundColor
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(child: Image.asset('assets/img/Logo Udayana.png', height: 119.45, width: 104.4,)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "SPEAKING TEST",
                        style: Theme.of(context).textTheme.headline1,
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
                      color: secondaryBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                      )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Register",
                        style: Theme.of(context).textTheme.headline1?.apply(color: Colors.black, letterSpacingDelta: 0, letterSpacingFactor: 0),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Student",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'John Doe',
                                hintStyle: Theme.of(context).textTheme.headline5,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'userspeak@mail.com',
                                hintStyle: Theme.of(context).textTheme.headline5,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: '* * * * * * * * * * * ',
                                hintStyle: Theme.of(context).textTheme.headline5,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        width: 10000,
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
                          },
                          child: Text(
                            "REGISTER",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius : const BorderRadius.all(Radius.circular(20)),
                          gradient: backgroundColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?"
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "LOGIN",
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
