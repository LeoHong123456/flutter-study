import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("AspectRatio"),
          ),
          body: const HomePage(),
        ),
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //AspectRatio页面上显示一个容器 宽高是屏幕的一半
    return AspectRatio(
      //高度是2,宽度占据整个屏幕
      aspectRatio: 2 / 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
