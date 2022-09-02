import 'package:flutter/material.dart';
import '../interfaces/testresultpage_interface.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import '../models/student_filter.dart';
import 'dialog_interfaces.dart';
import 'loginpage_interface.dart';

class ResultPage extends StatefulWidget {
  static const nameRoute = '/resultpage';

  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  DateTime _dateTime = DateTime.now();
  late SharedPreferences sharedPreferences;
  String name = 'loading';

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus () async{
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString('name').toString();
    });
    if (sharedPreferences.getString('token')==null){
      Navigator.of(context).pushReplacementNamed(LoginPage.nameRoute);
    }

  }

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('d MMM yyyy').format(_dateTime);
    String formatFilterDate = DateFormat('yyyy-MM-d').format(_dateTime);

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: gradientBackgroundColor),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.05 * size.height,
                    ),
                    Image.asset(
                      'assets/img/Logo Udayana.png',
                      height: 119.45,
                      width: 104.4,
                    ),
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
              child: PopupMenuButton(
                icon:  Icon(
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
                        context: context, builder: (context) => DialogLogOut(sharedPreferences: sharedPreferences,));
                  }
                },
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
                  mainAxisSize: MainAxisSize.max,
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
                            height: 42,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: greyscale, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    formattedDate,
                                    style: pickerDateFont,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: 1,
                                    color: dividerColor,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 20,
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2010),
                                            lastDate: DateTime(2099),
                                            initialDate: _dateTime)
                                        .then((date) {
                                      setState(() {
                                        _dateTime = date!;
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.calendar_month_outlined),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      gradient: gradientBackgroundColor,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "GO",
                                      style: headlineDate,
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Student : ${name}",
                      style: headlineName,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    FutureBuilder(
                      future: getStudent(formatFilterDate),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        if (snapshot.data == null){
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        }else{
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index){
                                return ScoreCard(size, DateFormat('d MMM yyyy').format(DateTime.parse(snapshot.data[index].dateTime)), DateFormat.Hm().format(DateTime.parse(snapshot.data[index].dateTime)), 0 , snapshot.data[index].id_test);
                                // return QuestionCard(size : size, id : index+1, timer : snapshot.data[index].timer);
                              },
                            ),
                          );
                        }
                      },
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

  Container ScoreCard(Size size, String formattedDate,
      String formatTime, int score, int id_test) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      height: 70,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal',
                style: headlineMini,
              ),
              Row(
                children: [
                  Text(
                    "$formattedDate",
                    style: dateFont,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$formatTime",
                    style: timeFont,
                  )
                ],
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Score",
                  style: headlineMini,
                ),
                Text(
                  "$score",
                  style: scoreFont,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              width: 40,
              height: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: secondaryColor),
              child: IconButton(
                onPressed: () {
                  sharedPreferences.setInt('id_test', id_test);
                  sharedPreferences.setString('formatDate', formattedDate);
                  sharedPreferences.setString('formatTime', formatTime);
                  Navigator.of(context).pushNamed(TestResultPage.nameRoute );
                },
                icon: Icon(Icons.remove_red_eye_outlined),
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                iconSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}


