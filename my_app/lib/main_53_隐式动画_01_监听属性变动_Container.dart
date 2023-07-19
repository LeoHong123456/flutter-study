import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true, color: Colors.pink.shade300),
      ),
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
        child: AnimatedContainer(
          //动画显示效果形式（贝塞尔线）
          curve: Curves.linear,
          //添加过度效果
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(20),
          width: flag ? 200 : 300,
          height: flag ? 200 : 300,
          //移动效果
          transform: flag
              ? Matrix4.translationValues(0, 0, 0)
              : Matrix4.translationValues(50, 0, 0),
          //可以处理图片以及文字溢出问题
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.pink.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("动画效果"),
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
