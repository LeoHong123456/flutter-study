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
  //在Flutter中key是不能重复使用的，key 是唯一标识，组件在更新的时候，其状态的保存主要是通过判断组件的类型或者Key是否一致
  //Key 分两种 局部Key(LocalKey), 全局Key(GlobalKey)
  //LocalKey: ValueKey, ObjectKey, UniqueKey(会随机生成)
  //GlobalKey: GlobalKey, GlobalObjectKey

  List<Widget> list = [
    const Box(key: ValueKey(1), color: Color.fromARGB(255, 205, 86, 126)),
    Box(key: UniqueKey(), color: Colors.green),
    const Box(key: ValueKey(3), color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Key状态管理方法")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            //打乱List元素顺序
            list.shuffle();
          });
        },
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: widget.color,
        // shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.color),
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text(
          "$_count",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
