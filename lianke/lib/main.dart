import 'package:flutter/material.dart';
import './icon_font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text("消息")),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        SizedBox(
          height: 20,
        ),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue),
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
