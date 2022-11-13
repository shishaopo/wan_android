// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:async';

import 'package:flutter/foundation.dart';

void main()  {
  var a = ValueKey(1);
  var b  =ValueKey(1);
  print(a == b);
}

Future<String> requestA() async {
  await Future.delayed(const Duration(seconds: 1));
  return "A";
}

Future<String> requestB() async {
  await Future.delayed(const Duration(seconds: 2));
  return "B";
}
