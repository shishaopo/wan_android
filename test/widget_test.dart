// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:async';

import 'package:flutter/foundation.dart';

void main() async {
  // var a = <int>[1, 2, 3];
  // var b = <int>[1, 2, 3];
  // var c = <String>["1", "2", "3"];
  // debugPrint(a.equals(b).toString());
  // debugPrint(a.equals(c).toString());
  var p1 = const Person("铁锤", 1);
  var p2 = const Person("铁锤", 2);
  if (kDebugMode) {
    print(identical(p1, p2));
  }
}

class Person{
  final String name;
  final int age;

 const Person(this.name, this.age);
}


extension ListExt on List {
  bool equals(List other) {
    //判断是否为同一对象
    if (identical(this, other)) {
      return true;
    }
    if (length != other.length) {
      return false;
    }
    for (var i = 0; i < length; i++) {
      if (this[i] != other[i]) {
        return false;
      }
    }
    return true;
  }
}

Future<String> requestA() async {
  await Future.delayed(const Duration(seconds: 1));
  return "A";
}

Future<String> requestB() async {
  await Future.delayed(const Duration(seconds: 2));
  return "B";
}
