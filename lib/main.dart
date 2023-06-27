import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android/app/main/main_page.dart';
import 'package:wan_android/common/router_path.dart';
import 'package:wan_android/entity/utils/log_utils.dart';

void main() {
  //全局拦截同步错误
  FlutterError.onError = (FlutterErrorDetails details) {
    //这行是把错误交给系统处理，系统会把错误打印到控制台。我们已经自己处理了，就不需要系统打印了
    // FlutterError.presentError(details);
    LogUtils.e(
        '出现同步错误 = ${details.exception.toString()} \n堆栈信息 = ${details.stack?.toString()}');
  };
  // 3.3.0以上支持，全局拦截异步错误
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    LogUtils.e('出现异步错误 = ${error.toString()} \n堆栈信息 = ${stack.toString()}');
    return false;
  };
  _init();
}

void _init() {
  //初始化,否则在runApp之前的flutter代码会报错
  WidgetsFlutterBinding.ensureInitialized();
  //这里可以做一些初始化操作

  //执行程序
  runApp(App());
}

class App extends StatelessWidget {
  ///用于全局获取context
  static final _navigatorKey = GlobalKey<NavigatorState>();

  ///全局context
  static BuildContext get app => _navigatorKey.currentContext!;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: _buildApp,
    );
  }

  final page = <Page<dynamic>>[];

  Widget _buildApp(BuildContext context, Widget? child) {
    MaterialApp.router(
      navigatorKey: _navigatorKey,
    )
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        //Android、IOS端出现差异时，按照IOS样式来
        platform: TargetPlatform.iOS,
        //全局设置默认背景颜色，各个页面有特殊情况自己处理
        canvasColor: Colors.white,
      ),
      //这里面注册的页面都是支持从外部跳转的页面
      routes: {
        RouterPath.main: (_) => const MainPage(),
      },
      //这是入口
      initialRoute: RouterPath.main,
    );
  }

  bool _popPage(Route<dynamic> route, dynamic result) {
    page.remove(route.settings);
    route.didPop(result);
    return false;
  }
}
