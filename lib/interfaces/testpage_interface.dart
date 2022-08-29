import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // final record = Record();
  // late bool isrecording;


  var _counter = 1;
  bool mulai = true;
  late Timer _timer;
  late int _intialStart =3;
  int _start = 10;


  startTimer (){
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        print(_start);
        print(_intialStart);
        if (_start == 0) {
          mulai =true;
          setState(() async {
            if(_counter ==10){
              timer.cancel();
              Navigator.of(context).pushReplacementNamed(CompletePage.nameRoute);
            }else{
              // isrecording = await record.isRecording();
              // if(isrecording){
              //   await record.stop();
              // }
              _counter++;
              _start =_intialStart;
            }
          });
        } else {
          mulai = false;
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var question = getQuestionItem(_counter);
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
                        // child: Text(
                        //   question.question.toString(),
                        //   style: questionFont,
                        //   textAlign: TextAlign.center,
                        // ),
                        child: FutureBuilder(
                          future: getQuestion(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if (snapshot.data == null){
                              return Container(
                                child: Center(
                                  child: Text("Loading"),
                                ),
                              );
                            }else{
                              // questionItem =snapshot.data[_counter-1].question;
                              _intialStart =snapshot.data[_counter-1].timer;
                              if(mulai){
                                _start = _intialStart;
                              }
                              return Text(
                                snapshot.data[_counter-1].question,
                                style: questionFont,
                                textAlign: TextAlign.center,
                              );
                            }
                          },
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
                    backgroundColor: Colors.red,
                    // child: isrecording ? Icon(Icons.mic) : Icon(Icons.stop),
                    child: Icon(Icons.mic) ,
                    onPressed: () async {
                      // await record.start(
                      //   path: 'D:\Programer\Kode Intellij IDEA\flutter_student_speakingtest\record\myFile$_counter.m4a',
                      // );
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


