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
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "消息",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 5,
                  wordSpacing: 5,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.double),
            )),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        //自带图标ICON
        Icon(Icons.search, size: 40, color: Colors.green),
        Icon(Icons.settings, size: 40, color: Colors.green),
        Icon(Icons.home, size: 40, color: Colors.green),
        Icon(
          Icons.person_pin_sharp,
          size: 40,
          color: Colors.green,
        ),
        //引入自定义ICON图标
        Icon(LeoIconFont.WECHAT_PAY, size: 40, color: Colors.green),
        Icon(LeoIconFont.ZFB_PAY, size: 40, color: Colors.blue)
      ],
    );
  }
}
