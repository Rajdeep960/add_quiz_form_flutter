import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_quiz.dart';
import 'package:quiz_app/screens/select_quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectQuiz(),
    );
  }
}
