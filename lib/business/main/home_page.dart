import 'package:flutter/material.dart';
import 'package:wan_android/entity/utils/log_utils.dart';
import 'package:wan_android/entity/utils/screen_utils.dart';

/// @author       ShiShaoPo
/// @time         2021/12/223:43
/// @description
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('标题'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: 50,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    LogUtils.e("渲染第$index个");
    return SizedBox(
      width: ScreenUtils.screenWidth(),
      height: 100,
      child: Text("这是第$index个item"),
    );
  }
}
