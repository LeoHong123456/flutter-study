import 'package:flutter/material.dart';
import 'package:wechat/utils/app_layout.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("状态组件学习")),
        body: const HomePage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(">>>>");
          },
          child: const Icon(Icons.add),
        ),
      ),
    ));

//有状态组件
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countNumber = 0;

  @override
  Widget build(BuildContext context) {
    print("$countNumber");
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$countNumber"),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  countNumber++;
                });
              },
              icon: const Icon(Icons.add),
              label: Text(
                "增加",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
