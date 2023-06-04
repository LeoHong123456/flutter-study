import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Flex布局",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: const HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(flex: 1, child: IconContainer(Icons.home, Colors.yellow)),
      Expanded(flex: 2, child: IconContainer(Icons.person, Colors.green)),
    ]);
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  IconContainer(this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 80,
        alignment: Alignment.center,
        color: color,
        child: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ));
  }
}
