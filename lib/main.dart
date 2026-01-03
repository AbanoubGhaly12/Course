import 'package:couse_1/session_7/bmi_calculator.dart';
import 'package:couse_1/session_7/bmi_with_navigation.dart';
import 'package:couse_1/session_7/demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const BmiInputScreen(),
      home: const BmiInputScreen(),
    ),
  );
}
