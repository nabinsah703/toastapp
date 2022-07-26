import 'package:flutter/material.dart';
import 'package:toast_message/login.dart';
import 'package:toast_message/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        primarySwatch: Colors.deepPurple,
      ),
      home: const SignupPage(),
    );
  }
}
