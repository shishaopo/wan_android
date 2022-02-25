import 'package:flutter_screenutil/flutter_screenutil.dart';

///数字扩展类
///@author ShiShaoPo
///@since 2022/1/13 2:30 下午
extension NumExt on num {
  ///将[size]转化为 size * 屏幕宽度 / 375
  ///方便百分比布局的情况
  get dp {
    return ScreenUtil().setWidth(this);
  }
}
