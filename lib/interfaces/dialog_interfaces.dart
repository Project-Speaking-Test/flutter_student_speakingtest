import 'package:flutter/material.dart';
import 'package:flutter_student_speakingtest/interfaces/loginpage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogLogOut extends StatelessWidget {
  SharedPreferences sharedPreferences;

  DialogLogOut({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('LOG OUT'),
      content: Text('Are you sure wanna log out ?'),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            sharedPreferences.clear();
            print(sharedPreferences.getString('token'));
            Navigator.of(context).pushReplacementNamed(LoginPage.nameRoute);
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'))
      ],
    );
  }
}
