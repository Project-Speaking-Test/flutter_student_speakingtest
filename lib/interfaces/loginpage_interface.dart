import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import 'registerpage_interface.dart';

import 'homepage_interface.dart';

class LoginPage extends StatelessWidget {
  static const nameRoute = '/loginpage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: gradientBackgroundColor
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.05 * size.height,
                    ),
                    Image.asset('assets/img/Logo Udayana.png', height: 119.45, width: 104.4,),
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
                  )
                ),
                child: Column(
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
                      padding: const EdgeInsets.only(left: 25, right: 25,top: 25, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: headlineHint,
                          ),
                          TextFormField(
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
                      height: 17,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      padding: const EdgeInsets.only(left: 25, right: 25,top: 25, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: headlineHint,
                          ),
                          TextFormField(
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
                      height: 17,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      width: 10000,
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
                        },
                        child: Text(
                          "LOGIN",
                          style: button1,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius : const BorderRadius.all(Radius.circular(100)),
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
                        onPressed: (){
                          Navigator.of(context).pushNamed(RegisterPage.nameRoute);
                        },
                        child: Text(
                          "Register",
                          style: button2,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius : const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                          color: borderColor,
                          width: 3,
                        )
                      ),
                    ),
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
