import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Question {
  String? question;
  int? timer;
  int? id_soal;

  Question({ required this.question, required this.timer, required this.id_soal});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
         question: json['question'], timer: json['timer'], id_soal: json['id_soal']);
  }
}

Future<List<Question>> getQuestion() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print('Token Local : ${sharedPreferences.getString('token').toString()}');
  Uri url = Uri.parse('https://unudspeakingtest.com/question.php?api=read');
  var header = {
    'token' : sharedPreferences.getString('token').toString()
  };
  final response = await http.get(url, headers: header);
  var jsonData = json.decode(response.body);

  List <dynamic> listquestion = (jsonData as Map<String, dynamic>)['data'];
  List<Question> questions = [];

  for (int i = 0 ; i < listquestion.length; i++){
    questions.add(Question.fromJson(listquestion[i]));
  }
  return questions;
}
