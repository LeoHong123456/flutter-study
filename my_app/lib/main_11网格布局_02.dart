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
        appBar: AppBar(centerTitle: true, title: const Text("测试")),
        body: HomePage4(),
      ),
    );
  }
}

//网格布局方式一
class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: const [
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
      ],
    );
  }
}

//网格布局方式二
class HomePage2 extends StatelessWidget {
  List<Widget> _initGridViewData() {
    List<Widget> tempList = [];
    for (var i = 0; i < 12; i++) {
      tempList.add(
        Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(color: Colors.green),
          child: Text(
            "标题${i}",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      //横轴子元素最大长度（此参数必传）
      maxCrossAxisExtent: 180,
      children: _initGridViewData(),
    );
  }
}

//网格布局方式三
class HomePage3 extends StatelessWidget {
  List<Widget> _initGridViewData() {
    List<Widget> tempList = [];
    for (var i = 0; i < 12; i++) {
      tempList.add(
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Colors.green),
          child: Text(
            "标题$i",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //纵向元素间距
      mainAxisSpacing: 2,
      //横向元素间距
      crossAxisSpacing: 2,
      //横向最大元素数量
      crossAxisCount: 2,
      //宽高比例
      childAspectRatio: 0.7,
      children: _initGridViewData(),
    );
  }
}

//网格布局方式四 extent
class HomePage4 extends StatelessWidget {
  List<Widget> _initGridViewData() {
    List<Widget> tempList = [];
    for (var i = 0; i < 12; i++) {
      tempList.add(
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Colors.green),
          child: Text(
            "标题$i",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      //纵向元素间距
      mainAxisSpacing: 2,
      //横向元素间距
      crossAxisSpacing: 2,
      //水平子元素为固定宽度
      maxCrossAxisExtent: 120,
      //宽高比例
      childAspectRatio: 0.7,
      children: _initGridViewData(),
    );
  }
}
