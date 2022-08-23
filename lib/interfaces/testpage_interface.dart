import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import 'completepage_interface.dart';

class TestPage extends StatefulWidget {
  static const nameRoute = '/testpage';
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var _counter = 1;

  late Timer _timer;
  final int _intialStart =3;
  int _start = 3;

  startTimer (){
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            if(_counter ==10){
              timer.cancel();
              Navigator.of(context).pushReplacementNamed(CompletePage.nameRoute);
            }else{
              _counter++;
              _start =_intialStart;
            }
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  @override
  void initState() {
    startTimer();
    super.initState();
  }

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
                      height: 0.03 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 0.03 * size.height,
                        ),
                        Image.asset('assets/img/Logo Udayana (Tanpa Nama).png', height: 47.96, width: 48.03,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "SPEAKING TEST",
                          style: headlineMain2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.05 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question",
                              style: headlineQuestion,
                            ),
                            Text(
                              "$_counter/10",
                              style: bodyQuestionAtributes,
                            )
                          ],
                        ),
                        Container(
                          width: 0.3 * size.width,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              color: timerBorderColor
                            )
                          ),
                          child: Center(
                            child: Text(
                              "$_start",
                              style: bodyQuestionAtributes,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.13 *size.height,
                    ),
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(
                        child: Text(
                          "Why do you think learning English is very important?",
                          style: questionFont,
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                height: 0.27 * size.height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: FloatingActionButton(
                    child: Icon(Icons.mic),
                    onPressed: (){

                    },
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}


