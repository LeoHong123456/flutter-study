import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Stack组件")),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.red.shade400,
      //Stack 是相对于外部容器定位，如果没有外部容器就相对于屏幕定位
      child: Stack(
        children: [
          Positioned(
              left: 20,
              bottom: 0,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              )),
          const Positioned(
            right: 0,
            top: 190,
            child: Text("你好Flutter!"),
          )
        ],
      ),
    );
  }
}
