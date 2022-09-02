import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Student {
  int? id_test;
  String? dateTime;
  int? id_student;

  Student ({this.id_test, this.dateTime, this.id_student});
  factory Student.fromJson(Map <String, dynamic> json) {
    return Student(
        id_test: json['id_test'], dateTime: json['datetime'], id_student: json['id_student'],
    );
  }
}

Future<List<Student>> getStudent(String date) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var id = sharedPreferences.getInt('id_student');
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=read_test&id_student=${id}&date=$date');
  var header = {
    'token' : sharedPreferences.getString('token').toString()
  };
  final response = await http.get(url, headers: header);
  var jsonData = json.decode(response.body);
  print(jsonData);
  List <dynamic> liststudent = (jsonData as Map<String, dynamic>)['data'];
  List<Student> student = [];

  for (int i = 0 ; i < liststudent.length; i++){
    student.add(Student.fromJson(liststudent[i]));
  }
  return student;
}
