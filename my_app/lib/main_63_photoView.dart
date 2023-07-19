import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import './route/routes_demo.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
      onGenerateRoute: onGenerateRoute,
      // initialRoute: "/hero",
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero动画"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/photoView",
                  arguments: {"image": "images/01.jpeg"}),
              child: Hero(
                tag: "images/01.jepg",
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("images/01.jpeg"),
                ),
              ),
            ),
            const Gap(8),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/photoView",
                  arguments: {"image": "images/jia1.jpeg"}),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("images/jia1.jpeg"),
              ),
            ),
            const Gap(8),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/photoView",
                  arguments: {"image": "images/jia2.jpeg"}),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("images/jia2.jpeg"),
              ),
            ),
            const Gap(8),
          ],
        ),
      ),
    );
  }
}
