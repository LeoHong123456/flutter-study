import 'package:flutter/material.dart';
import './data.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          title: const Text(
            "在线图集",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Widget> _initData() {
    var tempList = datas.map((item) {
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        child: Column(
          children: [
            Image.network(
              item["image"],
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
            const SizedBox(height: 5),
            Text(
              item["programmeName"],
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 180,
      children: _initData(),
    );
  }
}
