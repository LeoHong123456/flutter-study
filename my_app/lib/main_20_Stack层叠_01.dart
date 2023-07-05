import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade400,
          title: Text("Stack 重叠组件"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //可以使层叠元素居中
      alignment: Alignment.center,
      children: [
        Container(
          height: 400,
          width: 300,
          color: Colors.red.shade400,
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.yellow.shade300,
        ),
        const Text("你好Flutter")
      ],
    );
  }
}
