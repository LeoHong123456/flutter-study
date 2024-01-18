import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("首页"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("首页>>>"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/news");
              },
              icon: const Icon(Icons.new_label_sharp),
              label: const Text("跳转新闻页面"),
            )
          ],
        ),
      ),
    );
  }
}
