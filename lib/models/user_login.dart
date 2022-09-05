import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<UserLogin> loginUser ( String email, String password) async {
  Uri url = Uri.parse("https://unudspeakingtest.com/student.php?api=login");
  var body = { 'email': email, 'password': password};
  var header = {'Content-Type': 'application/json'};
  final respons = await http.post(url, body: jsonEncode(body), headers: header);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var jsonRespData = jsonDecode(respons.body);

  if (respons.statusCode ==200){
    sharedPreferences.setString('token', jsonRespData['data']['token'].toString());
    sharedPreferences.setString('name', jsonRespData['data']['name'].toString());
    sharedPreferences.setInt('id_student', jsonRespData['data']['id_student']);
    // print('Lokal token : ${sharedPreferences.getString('token')}');
    // print(sharedPreferences.getString('name'));
  }
  return UserLogin.fromJson(jsonRespData);
  // else{
  //   throw Exception('Failed to auth user');
  // }
}

class UserLogin{

  String? email;
  String? password;

  UserLogin({ required this.email, required this.password});

  factory UserLogin.fromJson(Map<String,dynamic>json){
    return UserLogin( email: json['email'], password: json['password']);
  }
}