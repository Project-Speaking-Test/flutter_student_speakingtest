import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

Future<void> postAudio(File answer, int id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse("https://unudspeakingtest.com/test.php?api=save_result");
  var request = http.MultipartRequest('POST', url);
  var header = {
    'token': sharedPreferences.getString('token').toString(),
    'Content-Type': 'multipart/form-data',
  };
  request.files.add(await http.MultipartFile.fromPath('answer', answer.path));
  request.headers.addAll(header);
  request.fields['id_test'] = '${sharedPreferences.getInt('id_test')}';
  request.fields['id_soal'] = '$id';
  var response = await request.send();
  print(response.reasonPhrase);
  // var header = {
  //   'Content-Type': 'multipart/form-data',
  //   'token' : sharedPreferences.getString('token').toString()
  // };
  // for (int i = 0; i< answer.length; i++){
  //   var body = {
  //     'id_test' : sharedPreferences.getInt('id_test'),
  //     'id_soal' : i
  //   };
  //   final respons = await http.post(url, body: jsonEncode(body), headers: header);
  //   var jsonRespData = jsonDecode(respons.body);
  //   if (jsonRespData['status'] == 1){
  //     // print(jsonRespData['message']);
  //   }else{
  //     throw Exception(jsonRespData['message']);
  //   }
  // }
}
