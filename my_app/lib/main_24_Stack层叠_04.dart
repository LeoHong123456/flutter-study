import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("布局练习"),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Stack(
            children: const [
              Positioned(
                top: 8,
                left: 8,
                child: Text("收藏"),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Text("购买"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
