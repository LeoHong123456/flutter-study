import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //垂直方向换页，默认是水平反向
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text("第一页", style: Theme.of(context).textTheme.headline1),
          ),
          Center(
            child: Text("第二页", style: Theme.of(context).textTheme.headline1),
          ),
          Center(
            child: Text("第三页", style: Theme.of(context).textTheme.headline1),
          ),
          Center(
            child: Text("第四页", style: Theme.of(context).textTheme.headline1),
          ),
          Center(
            child: Text("第五页", style: Theme.of(context).textTheme.headline1),
          ),Center(
            child: Text("第六页", style: Theme.of(context).textTheme.headline1),
          ),
        ],
      ),
    );
  }
}
