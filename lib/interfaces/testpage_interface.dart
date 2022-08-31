import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/interfaces/resultpage_interface.dart';
import 'package:flutter_student_speakingtest/models/audio_models.dart';
import 'package:flutter_student_speakingtest/models/question_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
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

  final _audioRecorder = Record();
  bool isRecording = false;


  int timeTick = 0;
  List<Question>? question;
  var _counter = 1;

  late final Directory? directory;
  late final String path;
  List<File> answer = [];

  Future<void> getQuestions() async {
    question = await getQuestion();
    if (question != null  && question!.isNotEmpty){
      setTimer();
    }
  }

  void setTimer() {
    if (_counter <= question!.length){
      final time = question?[_counter-1].timer ?? 0;
      timeTick = time;
      setState(() {});
      Timer.periodic(
        const Duration(seconds: 1),
            (timer) {
          if (time - timer.tick >= 0) {
            timeTick = time - timer.tick;
            setState(() {});
          } else {
            timer.cancel();
            if(isRecording == true){
              isRecording = false;
              // stopRecord();
              _stop();
            }
            _counter++;
            setTimer();
          }
        },
      );
    }else{
      print(answer);
      postAudio(answer);
      Navigator.of(context).pushReplacementNamed(ResultPage.nameRoute);
    }
  }
  // startRecord()async{
  //   await record.start();
  // }
  // stopRecord()async{
  //   await record.stop();
  // }
  Future<void> _stop() async {


    final audioPath = await _audioRecorder.stop();

    if (audioPath != null) {
      saveAudioFile(audioPath);
    }
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();
        // final isRecording = await _audioRecorder.isRecording();

        await _audioRecorder.start();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  setDirectory() async {
    directory = await getExternalStorageDirectory();
    print(directory);
    path = '${directory?.path}/audio';
    _createDirectory();
  }

  void _createDirectory() async {
    bool isDirectoryCreated = await Directory(path).exists();
    if (!isDirectoryCreated) {
      Directory(path).create().then((Directory directory) {
        print(directory.path);
      });
    }
  }

  Future<void> saveAudioFile(String? audio) async {
    // File audioPath = File(
    //     '$path/${now.year}${now.month}${now.day}/${audio?.split('/').last}');
    File audioFile = File('$audio');
    Uint8List bytes = await audioFile.readAsBytes();
    // audioPath.writeAsBytes(bytes);
    if (answer.isNotEmpty && answer.length == _counter) {
      answer[_counter - 1] = audioFile;
    } else {
      answer.add(audioFile);
    }
    print('after${answer.length.toString()}');
  }

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    setDirectory();
    getQuestions();
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
                              "$timeTick",
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
                          question?[_counter-1].question  ?? 'Loading',
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
                      backgroundColor: Colors.red,
                      child: !isRecording ? Icon(Icons.mic) : Icon(Icons.stop),
                      // child: Icon(Icons.mic) ,
                      onPressed: () async {
                        setState(() {
                          if (isRecording){
                            // stopRecord();
                            _stop();
                            isRecording = false;
                          }else{
                            // startRecord();
                            _start();
                            isRecording = true;
                          }
                        });
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

