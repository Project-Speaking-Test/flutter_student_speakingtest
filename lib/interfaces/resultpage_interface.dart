import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/constants/color.dart';
import 'package:flutter_student_speakingtest/constants/font.dart';

class ResultPage extends StatelessWidget {
  static const nameRoute = '/resultpage';
  const ResultPage({Key? key}) : super(key: key);

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
              bottom: 0,
              right: 0,
              child: Container(
                height: 0.62 * size.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
