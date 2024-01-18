import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("商品列表")),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        //排列方式，默认是垂直列表（vertical:垂直列表，horizontal：水平列表）
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            // height: 120,
            //在ListView垂直列表中宽度设置是无效的，默认是自适应(虚借助外层加容器控制)
            //在ListView 水平列表中高度设置是无效的，默认是自适应(虚借助外层加容器控制)
            width: 120,
            decoration: BoxDecoration(color: Colors.green),
            child: Column(
              children: [Image.network(""), Text("")],
            ),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.pink),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.yellow),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.red),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.pink[900]),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.green[600]),
          ),
          Container(
            // height: 120,
            width: 120,
            decoration: BoxDecoration(color: Colors.red[600]),
          ),
        ],
      ),
    );
  }
}
