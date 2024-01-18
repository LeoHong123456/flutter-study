import 'package:flutter/material.dart';

class PageViewBuildScreen extends StatefulWidget {
  const PageViewBuildScreen({super.key});

  @override
  State<PageViewBuildScreen> createState() => _PageViewBuildScreenState();
}

class _PageViewBuildScreenState extends State<PageViewBuildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 3,
          itemBuilder:(context, index){
            return  Center(
              child: Text("第${index+1}屏", style: Theme.of(context).textTheme.headline1),
            );
          }
      ));
  }
}
