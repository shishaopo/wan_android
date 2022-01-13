import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android/entity/utils/screen_utils.dart';
import 'package:wan_android/main.dart';

/// @Description:   Toast提示工具类
/// @Author:        ShiShaoPo
/// @CreateData:    2021/06/15  5:04 PM
class ToastUtils {
  static final FToast _fToast = FToast()..init(App.app);

  static Future<void> show(String message) async {
    //先把之前的隐藏掉
    _fToast.removeQueuedCustomToasts();
    //有context可以任意使用，flutter自己实现的toast
    _fToast.showToast(
      child: _buildToastView(message),
      gravity: ToastGravity.TOP,
    );
  }

  ///设置toast样式
  static Widget _buildToastView(String msg) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xe6eeeeee),
        borderRadius: BorderRadiusDirectional.circular(ScreenUtils.dp(16)),
      ),
      padding: EdgeInsetsDirectional.only(
        start: ScreenUtils.dp(16),
        top: ScreenUtils.dp(12),
        end: ScreenUtils.dp(16),
        bottom: ScreenUtils.dp(12),
      ),
      child: Text(
        msg,
        style: TextStyle(
          color: const Color(0xde000000),
          fontSize: ScreenUtils.dp(14),
        ),
      ),
    );
  }
}
