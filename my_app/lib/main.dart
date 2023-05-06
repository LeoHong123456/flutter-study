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
          appBar: AppBar(
            title: const Text("Row水平布局组件"),
            centerTitle: true,
          ),
          body: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconContainer(Icons.home, Colors.yellow),
          IconContainer(Icons.search, Colors.red),
          IconContainer(Icons.person, Colors.green),
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
