import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(title: const Text("Row水平布局组件"), centerTitle: true),
          body: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(5),
      color: Colors.black26,
      child: Row(
        //主轴（外部没用容器是自适应的）
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //辅轴居中（需要借助外部容器，需要设置容器高度）
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.home, Colors.yellow),
          IconContainer(Icons.search, Colors.red),
          IconContainer(Icons.person, Colors.green)
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  IconContainer(this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 120,
        alignment: Alignment.center,
        color: color,
        child: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ));
  }
}
