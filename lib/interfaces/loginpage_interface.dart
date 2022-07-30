import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/constants/color.dart';

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
                gradient: backgroundColor
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Image.asset('assets/img/Logo Udayana.png'),
                    ),
                    SizedBox(
                      height: 30,
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
                height: 0.58 * size.height,
                decoration: BoxDecoration(
                  color: secondaryBackgroundColor,
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
                      style: Theme.of(context).textTheme.headline2,
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
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      padding: const EdgeInsets.only(left: 25, right: 25,top: 25, bottom: 5),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      width: 10000,
                      child: TextButton(
                        onPressed: (){

                        },
                        child: Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.all(Radius.circular(20)),
                        gradient: backgroundColor,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 27),
                      width: 10000,
                      child: TextButton(
                        onPressed: (){

                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.headline4?.apply(color: borderColor),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.all(Radius.circular(20)),
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
