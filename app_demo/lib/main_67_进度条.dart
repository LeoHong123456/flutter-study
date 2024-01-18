import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
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
      appBar: AppBar(title: const Text("Flutter异步")),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            //进度条颜色
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
          SizedBox(height: 20),
          //线性进度条
          LinearProgressIndicator(
            value:0.85,
            backgroundColor: Colors.green,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
          SizedBox(height: 20),
          //IOS进度条
          CupertinoActivityIndicator(),
          SizedBox(height: 20),
          CupertinoActivityIndicator(
            radius: 20,
          ),
        ],
      )),
    );
  }
}
