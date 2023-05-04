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
          centerTitle: true,
          title: const Text("相册"),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _initData(context, index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          Image.network(
            datas[index]["image"],
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            datas[index]["programmeName"],
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //元素个数必须传
        itemCount: datas.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //元素个数
          crossAxisCount: 2,
          //X轴Widget之间间距
          crossAxisSpacing: 2,
          //Y轴Widget之间间距
          mainAxisSpacing: 2,
          //宽高比例
          childAspectRatio: 1,
        ),
        itemBuilder: _initData);
  }
}
