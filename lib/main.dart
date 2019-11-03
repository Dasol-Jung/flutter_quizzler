import 'package:flutter/material.dart';
import './routes/homepage.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData.dark(),
      home: Homepage()
    );
  }
}