import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/font.dart';

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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Result",
                      style: headlineTitle2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Data",
                          style: headlineDatePicker,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 0.65 * size.width,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(

                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Student : John Doe",
                      style: headlineName,
                    ),
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
