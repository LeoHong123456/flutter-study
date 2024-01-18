import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Column",
            style: TextStyle(color: Colors.pink),
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        //主轴分布排列
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //辅轴居左显示
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.home, color: Colors.green, size: 100),
          Icon(Icons.search, color: Colors.green, size: 100),
          Icon(Icons.person, color: Colors.green, size: 100),
        ],
      ),
    );
  }
}
