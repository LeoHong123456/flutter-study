import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Stack Align组件使用")),
          body: const HomePage(),
        ),
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: const Align(
        //算法：(Alignment.x * childWidth/2 + childWidth/2, Alignment.y*childHeight/2+ childHeight/2)
        alignment: Alignment(-0.5, 1),
        // alignment: Alignment.center,
        child: Text("你好Flutter"),
      ),
    );
  }
}
