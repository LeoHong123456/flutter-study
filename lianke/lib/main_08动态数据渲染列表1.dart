import 'package:flutter/material.dart';
import './data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("动态列表"),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
//方法名下滑线开头代码私有方法,外部无法使用
//使用for循环封装组件读取文件中的数据
  List<Widget> _initListData1() {
    List<Widget> tempList = [];
    for (var i = 0; i < datas.length; i++) {
      tempList.add(Column(children: [
        ListTile(
          title: Text(datas[i]["programmeName"]),
          leading: Text(datas[i]["channelName"]),
          trailing: Text(datas[i]["attentionRateDesc"]),
        ),
        Divider(),
      ]));
    }
    return tempList;
  }

//方法二
  List<Widget> _initListData2() {
    var tempList = datas.map((value) {
      return ListTile(
        leading: Text(value["channelName"]),
        title: Text(value["programmeName"]),
        trailing: Text(value["attentionRateDesc"]),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    print(datas);
    return ListView(
      children: this._initListData2(),
    );
  }
}
