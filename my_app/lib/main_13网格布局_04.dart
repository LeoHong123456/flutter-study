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
      child: Column(
        children: [
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black26, width: 1, style: BorderStyle.solid),
                image: DecorationImage(
                    image: NetworkImage(datas[index]["image"]),
                    fit: BoxFit.cover),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          ),
          const SizedBox(height: 5),
          Text(
            datas[index]["programmeName"],
            style: const TextStyle(fontSize: 12),
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
          crossAxisSpacing: 8,
          //Y轴Widget之间间距
          mainAxisSpacing: 8,
          //宽高比例
          childAspectRatio: 1,
        ),
        itemBuilder: _initData);
  }
}
