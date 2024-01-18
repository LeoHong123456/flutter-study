import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Wrap布局练习"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onPressed() {
    print(">>>>>");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Text("热搜", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Divider(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Button(text: "凡人修仙传", onPressed: _onPressed),
            Button(text: "笑傲江湖", onPressed: _onPressed),
            Button(text: "龙蛇演义", onPressed: _onPressed),
            Button(text: "新三国", onPressed: _onPressed),
            Button(text: "少帅", onPressed: _onPressed),
            Button(text: "神雕侠侣", onPressed: _onPressed),
            Button(text: "隋唐英雄传", onPressed: _onPressed),
            Button(text: "创业时代", onPressed: _onPressed),
            Button(text: "鸡毛飞上天", onPressed: _onPressed),
            Button(text: "水浒传", onPressed: _onPressed),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("历史记录", style: Theme.of(context).textTheme.titleLarge)
          ],
        ),
        const Divider(),
        Column(
          children: const [
            ListTile(title: Text("凡人修仙传")),
            Divider(),
            ListTile(title: Text("笑傲江湖")),
            Divider(),
            ListTile(title: Text("创业时代")),
            Divider(),
            ListTile(title: Text("新三国")),
            Divider(),
            ListTile(title: Text("鸡毛飞上天")),
            Divider(),
          ],
        ),
        const SizedBox(height: 40),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 60,
            child: ElevatedButton.icon(
              onPressed: _onPressed,
              icon: const Icon(Icons.delete),
              label: const Text("清空历史记录",
                  style: TextStyle(fontSize: 40, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink.shade300),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
            ),
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          //修改按钮背景颜色
          backgroundColor: MaterialStateProperty.all(Colors.pink.shade300),
          //修改文字颜色
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          //修改边框颜色
          side: MaterialStateProperty.all(
              BorderSide(width: 1, color: Color.fromARGB(255, 67, 63, 65))),
          //修改圆角
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
    );
  }
}
