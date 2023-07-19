import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter 动画")),
      body: Stack(
        children: [
          ListView(
            children: const [
              ListTile(title: Text("列表一")),
              ListTile(title: Text("列表二")),
              ListTile(title: Text("列表三")),
              ListTile(title: Text("列表四")),
              ListTile(title: Text("列表一")),
              ListTile(title: Text("列表二")),
              ListTile(title: Text("列表三")),
              ListTile(title: Text("列表四")),
              ListTile(title: Text("列表一")),
              ListTile(title: Text("列表二")),
              ListTile(title: Text("列表三")),
              ListTile(title: Text("列表四")),
              ListTile(title: Text("列表一")),
              ListTile(title: Text("列表二")),
              ListTile(title: Text("列表三")),
              ListTile(title: Text("列表四")),
            ],
          ),
          //支持动画效果
          AnimatedPositioned(
            top: flag ? 10 : 560,
            right: flag ? 10 : 300,
            //表示动画效果1.5秒
            duration: const Duration(seconds: 1, milliseconds: 500),
            //动画显示效果形式（贝塞尔线）
            curve: Curves.ease,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.pink.shade300,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
    );
  }
}
