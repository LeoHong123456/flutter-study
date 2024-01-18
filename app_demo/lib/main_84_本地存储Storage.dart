import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './utils/storage.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String result = "";

  @override
  void initState() {
    super.initState();
  }

  _saveData() async {
    final prefs = await _prefs;
    await prefs.setInt('counter', 10);
    await prefs.setBool('repeat', true);
    await prefs.setDouble('decimal', 1.5);
    await prefs.setString('action', 'Start');
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
  }

  _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? action = prefs.getString("action");
    print(action);
  }

  _removeData() async {
    final prefs = await _prefs;
    prefs.remove("action");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("本地存储"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
               Map data = {
                "code": 0,
                "msg": "ok",
                "message": "ok",
                "data": []
                };
                Storage.setData("result", data);
              },
              child: const Text("存储数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                var data = await Storage.getData("result");
                 setState(() {
                   result = json.encode(data!);
                 });
              },
              child: const Text("获取数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Storage.removeData("result");
                setState(() {
                  result = '';
                });
              },
              child: const Text("清除数据"),
            ),
            const SizedBox(height: 20),
            Text(result)
          ],
        ),
      )
    );
  }
}
