import 'package:flutter/foundation.dart';

/// @author       ShiShaoPo
/// @time         2022/11/1317:04
/// @description  固定配置参数
class BuildConfig {
  bool isRelease() {
    return kReleaseMode;
  }

  bool isProfile() {
    return kProfileMode;
  }

  bool isDebug() {
    return kDebugMode;
  }
}
