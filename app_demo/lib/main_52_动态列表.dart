import 'dart:async';

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
  final _globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ["第一条", "第二条"];
  bool flag = true;

  Widget _buildItem(index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _deleteItem(index),
      ),
    );
  }

  _deleteItem(index) {
    if (flag == true) {
      flag = false;
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var removeItem = _buildItem(index);
        list.removeAt(index);
        return ScaleTransition(scale: animation, child: removeItem);
      });
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedList动态列表")),
      body: AnimatedList(
        key: _globalKey,
        initialItemCount: list.length,
        itemBuilder: ((context, index, animate) {
          return FadeTransition(
            opacity: animate,
            child: _buildItem(index),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            list.add("新增数据");
            _globalKey.currentState!.insertItem(list.length - 1);
          });
        },
      ),
    );
  }
}
