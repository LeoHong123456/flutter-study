import 'package:flutter/material.dart';
import 'icon_font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("消息")),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //列表
    return ListView(
      padding: EdgeInsets.all(5),
      children: const <Widget>[
        //列表标题
        ListTile(
          //前置ICON
          leading: Icon(Icons.home),
          //标题
          title: const Text("首页"),
          //二级标题
          subtitle: const Text("子标题"),
          //后置ICON
          trailing: Icon(Icons.chevron_right_sharp),
        ), 
        //分割线
        Divider(),

        ListTile(
          leading: Icon(Icons.search),
          title: Text("搜索"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        //分割线
        Divider(),

        ListTile(
          leading: Icon(Icons.approval),
          title: Text("位置"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        //分割线
        Divider(),

        ListTile(
          leading: Icon(Icons.person),
          title: Text("我"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        //分割线
        Divider(),

        ListTile(
          leading: Icon(Icons.person_add),
          trailing: Icon(Icons.chevron_right_sharp),
          title: Text("在线客服"),
        ),
        //分割线
        Divider(),

        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
      ],
    );
  }
}
