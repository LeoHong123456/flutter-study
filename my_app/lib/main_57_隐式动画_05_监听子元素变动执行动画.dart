import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300),
    ),
    home: const HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter 动画")),
      body: Center(
        child: Container(
          width: 230,
          height: 260,
          color: Colors.pink.shade300,
          //当子元素变动会触发动画
          child: AnimatedSwitcher(
            //修改动画效果(支持多个动画效果Child修改即可)
            transitionBuilder: ((child, animation) {
              return ScaleTransition(scale: animation, child: child);
            }),
            // switchInCurve: Curves.easeIn,
            // switchOutCurve: Curves.easeOut,
            duration: const Duration(seconds: 1),

            //动画显示图片
            // child: flag
            //     ? const CircularProgressIndicator()
            //     : Image.asset("images/01.jpeg", fit: BoxFit.cover),

            //只有一个文本组件的时候需要加上Key Key 变动了会执行动画
            child: Text(key: UniqueKey(), flag ? "学会了吗？" : "学会了！"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
    );
  }
}
