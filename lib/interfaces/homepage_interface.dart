import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speaking Test"),
      ),
    );
  }
}
