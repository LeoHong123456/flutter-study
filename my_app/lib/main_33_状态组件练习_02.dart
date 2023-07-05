import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("状态组件学习")),
        body: ListView(
          children: _list.map((e) => ListTile(title: Text(e))).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _list.add("我是新增的列表");
            });
          },
        ));
  }
}
