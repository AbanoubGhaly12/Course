// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:couse_1/main.dart';

void main() {
  Person person = Person("John", 30, "male");
  print(person.name);
  person.name = "Doe";

}

class Person {
  String _name;
  int _age;
  String _gender;

  Person(this._name , this._age ,this._gender);

  String get name {
    return _name;
  }

  set name(String value){
    _name = value;
  }


  // String get gender => _gender;
  //
  // set gender(String value) {
  //   _gender = value;
  // }
  //
  // int get age => _age;
  //
  // set age(int value) {
  //   _age = value;
  // }
  //
  // String get name => _name;
  //
  // set name(String value) {
  //   _name = value;
  // }
}