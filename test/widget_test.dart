// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:async';

import 'package:flutter/foundation.dart';

void main() async {
  var start = DateTime.now().millisecondsSinceEpoch;
  // var aResult = requestA();
  // var bResult = requestB();
  var a = await requestA();
  var b = await requestB();
  var end = DateTime.now().millisecondsSinceEpoch;
  if (kDebugMode) {
    print(a);
    print(b);
    print(end - start);
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
