import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_student_speakingtest/models/testdetail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color.dart';
import '../constants/font.dart';

class TestResultPage extends StatefulWidget {
  static const nameRoute = '/testresultpage';
  const TestResultPage({Key? key}) : super(key: key);

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  var _counter = 1;
  AudioPlayer audioPlayer = AudioPlayer();
  List<TestDetail>? testDetail;
  String? formatDate;
  String? formatTime;
  String? question;
  int? score;
  bool isLoading = true;



  getData ()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? id = sharedPreferences.getInt('id_test');
    print(id);
    formatDate =sharedPreferences.getString('formatDate');
    print(formatDate);
    formatTime =sharedPreferences.getString('formatTime');
    print(formatTime);
    testDetail = await getTestDetail(id!);
    print('dah dsni');
    // testDetail = await getTestDetail(1);
    if (testDetail != null){
        score = testDetail?[_counter-1].score ?? 0;
        question = testDetail?[_counter-1].question;
    }else{
      score =0;
      question = 'No Question';
    }
    isLoading = false;
    setState(() {

    });


  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: isLoading ? Center(child: CircularProgressIndicator(),) : Stack(
          children: [
            Container(
              padding: EdgeInsets.all(0.03 * size.height),
              decoration: BoxDecoration(gradient: gradientBackgroundColor),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 11.98,
                    ),
                    Text(
                      "TEST RESULT",
                      style: headlineMain2,
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formatDate!,
                          // '123',
                          style: headlineDate,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          formatTime!,
                          // '123',
                          style: headlineDate,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.02 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 50,
                          width: 0.15 * size.width,
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if(_counter !=1){
                                  _counter--;
                                }
                                score = testDetail?[_counter-1].score;
                                question = testDetail?[_counter-1].question;
                                print(question);
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_left_sharp),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 0.03 * size.width,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: dividerColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: 50,
                            alignment: Alignment.center,
                            width: 0.5 * size.width,
                            child: Text(
                              '$_counter / 10',
                              style: headlineMainNumberQuestion,
                            )),
                        SizedBox(
                          width: 0.03 * size.width,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 50,
                          width: 0.15 * size.width,
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if (_counter != 10){
                                  _counter++;
                                }
                                score = testDetail?[_counter-1].score;
                                question = testDetail?[_counter-1].question;
                                print(question);
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_right_sharp),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.06 * size.height,
                    ),
                    Container(
                      width: size.width - (2 * 0.03 * size.width),
                      height: 0.45 * size.height,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 100,
                            child: Center(
                              child: Text(
                                      question!,
                                  // '123',
                                      style: headlineResultQuestion,
                                      textAlign: TextAlign.center,
                                    ),
                              // child: FutureBuilder(
                              //   future: getQuestion(),
                              //   builder: (BuildContext context, AsyncSnapshot snapshot){
                              //     if (snapshot.data == null){
                              //       return Container(
                              //         child: Center(
                              //           child: Text("Loading"),
                              //         ),
                              //       );
                              //     }else{
                              //       // questionItem =snapshot.data[_counter-1].question;
                              //       return Text(
                              //         snapshot.data[_counter-1].question,
                              //         style: headlineResultQuestion,
                              //         textAlign: TextAlign.center,
                              //       );
                              //     }
                              //   },
                              // ),
                            ),
                          ),
                          Center(
                              child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: IconButton(
                              icon: Icon(Icons.play_arrow_outlined),
                              onPressed: () {
                                Source audioUrl;
                                var answer = testDetail?[_counter-1].answer;
                                if (answer!=null){
                                  audioUrl = UrlSource(answer);
                                  audioPlayer.play(audioUrl);
                                }
                              },
                              color: Colors.white,
                              iconSize: 50,
                            ),
                          )),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: dividerColor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              'SCORE : ${score??0}',
                              // '123',
                              style: headlineTitle2,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.07 * size.height,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_left_sharp,
                              color: Colors.white),
                          Text(
                            'BACK TO RESULTS',
                            style: bodyQuestionAtributes,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0.03 * size.height,
              left: 0.03 * size.height,
              child: Image.asset(
                'assets/img/Logo Udayana (Tanpa Nama).png',
                height: 47.96,
                width: 48.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
