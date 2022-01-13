import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @Description:   屏幕工具类
/// @Author:        ShiShaoPo
/// @CreateData:    2021/04/28  3:47 PM
class ScreenUtils {
  ///返回值为屏幕宽度的dp
  static double screenWidth() {
    return ScreenUtil().screenWidth;
  }

  ///返回值为屏幕高度的dp
  static double screenHeight() {
    return ScreenUtil().screenHeight;
  }

  ///是否为横屏
  static bool isLand(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > size.height;
  }
}
