import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.green),
        home: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text("微信",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      //字母间距
                      letterSpacing: 5,
                      //字间距
                      wordSpacing: 5,
                      // decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      // decorationStyle: TextDecorationStyle.dashed
                    ))),
            body: Home()));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MyTitle(), Wapper(), TabBar()],
    );
  }
}

class MyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 38,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Color.fromARGB(255, 147, 151, 148), width: 1),
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 124, 126, 124),
                spreadRadius: 1,
                offset: Offset(1, 1),
                blurRadius: 15)
          ]),
    );
  }
}

class Wapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
