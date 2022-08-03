import 'package:flutter/material.dart';
import '../constants/font.dart';
import 'testpage_interface.dart';

import '../constants/color.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: gradientBackgroundColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/Logo Udayana.png',height: 178.28, width: 155.83),
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
              top: 15,
              right: 15,
              child: FloatingActionButton(
                onPressed: (){

                },
                child: const Icon(Icons.person),
                elevation: 0,
                backgroundColor: const Color.fromARGB(21, 255, 255, 255),
                highlightElevation: 0,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 0.2* size.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50)
                  )
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    padding: const EdgeInsets.all(5),
                    width: 100000,
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed(TestPage.nameRoute);
                      },
                      child: Text(
                        "START",
                        style: button3,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      gradient: gradientBackgroundColor
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
