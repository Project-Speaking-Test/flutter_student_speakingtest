import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/font.dart';
import '../models/Arguments.dart';
import 'dialog_interfaces.dart';
import 'loginpage_interface.dart';
import 'resultpage_interface.dart';
import 'package:flutter_student_speakingtest/models/audio_models.dart';

import '../constants/color.dart';

class CompletePage extends StatefulWidget {
  static const nameRoute = '/completepage';
  const CompletePage({Key? key}) : super(key: key);

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  late SharedPreferences sharedPreferences;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      Navigator.of(context).pushReplacementNamed(LoginPage.nameRoute);
    }
  }

  submitResult(Arguments argument) async {
    isLoading = true;
    final listAnswer = argument.listAnswer;
    final listId = argument.listId;
    for (var i = 0; i < listAnswer.length; i++) {
      await postAudio(listAnswer[i], listId[i]);
    }
    isLoading = false;
    Navigator.of(context).pushReplacementNamed(ResultPage.nameRoute);
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
                gradient: gradientBackgroundColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/Logo Udayana.png',
                        height: 105.32, width: 92.06),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "SPEAKING TEST",
                      style: headlineMain1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 290,
                      height: 300,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white),
                      child: isLoading ? CircularProgressIndicator() : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/cracker.png'),
                          const SizedBox(
                            height: 23,
                          ),
                          Text(
                            "YOU HAVE COMPLETED",
                            style: completeFont,
                          ),
                          Text(
                            "THE TEST",
                            style: completeFont,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.17 * size.height,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: PopupMenuButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Log Out'),
                      value: 1,
                    )
                  ];
                },
                onSelected: (value) {
                  if (value == 1) {
                    showDialog(
                        context: context,
                        builder: (context) => DialogLogOut(
                          sharedPreferences: sharedPreferences,
                        ));
                  }
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 0.2 * size.height,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(50))),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    padding: const EdgeInsets.all(5),
                    width: 100000,
                    child: TextButton(
                      onPressed: () {
                        submitResult(ModalRoute.of(context)!.settings.arguments
                        as Arguments);
                      },
                      child: Text(
                        "SUBMIT",
                        style: button3,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(100)),
                        gradient: gradientBackgroundColor),
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
