import 'package:flutter/material.dart';
import './icon_font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("网格布局"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //scrollDirection 类型：Axis 滚动方法
    //padding  类型EdgeInsetsGeometry  内边距
    //resolve  类型：bool  组件反向排序
    //crossAxisSpacing 类型：double 水平子Widget之间间距
    //mainAxisSpacing 类型：double  垂直子Widget之间间距
    //crossAxisCount 类型：double 一行Widget数量
    //maxCrossAxisExtent 类型：double  横轴子元素的最大长度
    //childAspectRatio 类型：double 子Widget宽高比列
    //children
    //gridDelegate 控制布局主要用在GridView.builder里面
    return GridView.count(
      crossAxisCount: 4, //一行的数量
      children: const [
        Icon(LeoIconFont.ZFB_PAY),
        Icon(Icons.home),
        Icon(Icons.person_pin),
        Icon(Icons.abc_rounded),
        Icon(Icons.access_alarm_sharp),
        Icon(Icons.ice_skating),
        Icon(Icons.phone),
        Icon(Icons.telegram)
      ],
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
