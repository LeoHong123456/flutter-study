import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flex自适应布局"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: IconContainer(
                Icons.home, const Color.fromARGB(255, 164, 238, 202))),
        const Icon(Icons.search)
      ],
    );
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
        height: 50,
        alignment: Alignment.center,
        color: color,
        child: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ));
  }
}
