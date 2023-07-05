import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("搜索页面"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("搜索页面>>>"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              icon: const Icon(Icons.home),
              label: const Text("跳转回首页"),
            )
          ],
        ),
      ),
    );
  }
}
