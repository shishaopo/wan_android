import 'package:flutter/material.dart';
import 'package:wan_android/app/main/main_page.dart';

/// @author       ShiShaoPo
/// @time         2022/11/922:45
/// @description
class RouterPath {
  static String main = "main";
  static String second ="second";

  static Map<String, WidgetBuilder> routerCreator() => {
    RouterPath.main: (_) => MainPage(),
  };
}
