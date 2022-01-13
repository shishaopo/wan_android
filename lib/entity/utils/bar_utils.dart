import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///@Description:    状态栏和导航栏工具栏
///@Author:         ShiShaoPo
///@CreateDate:     2021/8/2 7:26 下午
class BarUtils {
  /// 白色主题
  static const SystemUiOverlayStyle white = SystemUiOverlayStyle(
    //导航栏背景颜色
    systemNavigationBarColor: Colors.white,
    //导航栏图标颜色
    systemNavigationBarIconBrightness: Brightness.dark,
    //导航栏分割线颜色
    systemNavigationBarDividerColor: null,
    //状态栏背景颜色
    statusBarColor: null,
    //状态栏图标颜色，只支持Android6.0以上
    statusBarIconBrightness: Brightness.dark,
    //状态栏图标模式，只支持IOS
    statusBarBrightness: Brightness.dark,
  );

  /// 黑色主题
  static const SystemUiOverlayStyle black = SystemUiOverlayStyle(
    //导航栏背景颜色
    systemNavigationBarColor: Colors.black,
    //导航栏图标颜色
    systemNavigationBarIconBrightness: Brightness.light,
    //导航栏分割线颜色
    systemNavigationBarDividerColor: null,
    //状态栏背景颜色
    statusBarColor: null,
    //状态栏图标颜色，只支持Android6.0以上
    statusBarIconBrightness: Brightness.light,
    //状态栏图标模式，只支持IOS
    statusBarBrightness: Brightness.light,
  );
}
