import 'package:flutter/material.dart';
import 'quiz_page.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizzo"),
        ),
        body: SafeArea(
          child: Center(
            child: RaisedButton(
              child: Text("Start"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizPage()));
              },
            ),
          ),
        ));
  }
}
