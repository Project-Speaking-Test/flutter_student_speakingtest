import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TestDetail {
  int? id_std;
  int? id_test;
  int? id_soal;
  String? question;
  String? answer;
  int? score;

  TestDetail({this.id_std, this.id_test, this.id_soal, this.question, this.answer, this.score});

  factory TestDetail.fromJson (Map<String, dynamic> json){
    return TestDetail(
      id_test: json['id_test'],
      id_soal: json['id_soal'],
      id_std: json['id_std'],
      question: json['question'],
      answer: json['answer'],
      score: json['score']
    );
  }
}

Future<List<TestDetail>> getTestDetail (int id_test) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=test_detail&id_test=$id_test');
  var header = {
    'token' : sharedPreferences.getString('token').toString()
  };
  final response = await http.get(url, headers: header);
  var jsonData = json.decode(response.body);
  print(jsonData);
  List <dynamic> listQuestionDetail = (jsonData as Map<String, dynamic>)['data'];
  List<TestDetail> testDetail = [];
  print(listQuestionDetail[0]);

  for (int i = 0 ; i < listQuestionDetail.length; i++){
    testDetail.add(TestDetail.fromJson(listQuestionDetail[i]));
  }
  return testDetail;
}