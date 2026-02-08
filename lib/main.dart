import 'package:couse_1/session_7/bmi_calculator.dart';
import 'package:couse_1/session_7/bmi_with_navigation.dart';
import 'package:couse_1/session_7/demo.dart';
import 'package:couse_1/session_8/form_screen.dart';
import 'package:couse_1/session_9/login_screen.dart';
import 'package:couse_1/session_9/registration_form_screen.dart';
import 'package:flutter/material.dart';
import 'session_10/session_10_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Session10Home(),
    );
  }
}
