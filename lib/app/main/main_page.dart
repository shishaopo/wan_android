import 'package:flutter/material.dart';
import 'package:wan_android/common/router_path.dart';

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
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, RouterPath.second);
          },
          child: Text("点击跳转"),
        ),
      ),
    );
  }
}
