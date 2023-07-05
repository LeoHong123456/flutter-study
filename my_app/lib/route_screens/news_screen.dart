import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class NewsScreen extends StatefulWidget {
  final String title;
  const NewsScreen({super.key, required this.title});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("新闻"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${widget.title} >>>>"), //获取NewScreen 中的title
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/form", arguments: {"age": 18});
              },
              icon: const Icon(Icons.edit),
              label: const Text("跳转表单页面"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //返回到上一个页面
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
