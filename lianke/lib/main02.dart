import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "连客ABA",
        theme: ThemeData(
          primaryColor: Colors.green[300],
        ),
        home: MyHomePage(title: "连客"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyAppDemo(),
    );
  }
}

class MyAppDemo extends StatelessWidget {
  MyAppDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text("微信>>>"),
      Text("添加好友>>>"),
    ]));
  }
}
