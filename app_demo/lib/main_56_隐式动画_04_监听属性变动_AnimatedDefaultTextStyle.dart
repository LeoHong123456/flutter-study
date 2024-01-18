import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter 动画")),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
          //支持动画效果的文本组件
          child: AnimatedDefaultTextStyle(
            //动画显示效果形式（贝塞尔线）
            curve: Curves.ease,
            style: TextStyle(fontSize: flag ? 10 : 50),
            duration: const Duration(seconds: 1),
            child: const Text("动画效果"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
    );
  }
}
