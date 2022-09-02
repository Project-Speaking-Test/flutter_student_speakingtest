import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Start {
  int? id_test;

  Start({required id_test});

  factory Start.fromJson(Map<String, dynamic> json){
    return Start(
      id_test: json['id_test']
    );
  }
}
Future<Start> postQuestion (String date, int id_student ) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse("https://unudspeakingtest.com/test.php?api=start");
  var body = {
    "datetime" : date,
    "id_student" : id_student
  };
  var header = {
    'Content-Type': 'application/json',
    'token' : sharedPreferences.getString('token').toString()
  };
  final respons = await http.post(url, body: jsonEncode(body), headers: header);
  var jsonRespData = jsonDecode(respons.body);

  if (jsonRespData['status'] == 1){
    // print(sharedPreferences.getInt('id_student'));
    sharedPreferences.setInt('id_test', jsonRespData['data']['id_test']);
    return Start.fromJson(jsonRespData['data']);
  }else{
    throw Exception(jsonRespData['message']);
  }
}