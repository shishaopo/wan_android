import 'package:logger/logger.dart';

/// @Description:   日志打印工具类，只有debug模式才会打印
/// @Author:        ShiShaoPo
/// @CreateData:    2021/06/03  11:27 AM
class LogUtils {
  LogUtils._();

  static final _logger = Logger();

  static void v(dynamic message) {
    _logger.v(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  ///info级别打印，查看属性或变量使用
  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  ///error日志打印，出现错误的情况下使用
  static void e(dynamic message) {
    _logger.e(message);
  }
}
