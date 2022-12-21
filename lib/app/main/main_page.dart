import 'package:flutter/material.dart';
import 'package:wan_android/entity/utils/log_utils.dart';

/// @author       ShiShaoPo
/// @time         2022/11/922:47
/// @description  首页
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // var uri = Uri.parse("uri");
    // var scheme = uri.scheme;
    // var host = uri.host;
    // var port = uri.port;
    // var path = uri.pathSegments;
    // var query = uri.queryParametersAll;
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _addOne();
              },
              child: const Text("同步错误"),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _addTwo();
              },
              child: const Text("异步错误"),
            ),
            // Image.asset("asset/image/page_error.png")
          ],
        ),
      ),
    );
  }

  void _addOne() {
    String? a = "a";
    var b = a as int;
    LogUtils.e(b);
  }

  void _addTwo() {
    Future.delayed(const Duration(microseconds: 500), () {
      String? a = "a";
      var b = a as int;
      LogUtils.e(b);
    });
  }
}
