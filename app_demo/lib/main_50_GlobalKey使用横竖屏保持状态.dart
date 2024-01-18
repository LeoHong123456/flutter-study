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
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      Box(key: _globalKey1, color: Colors.pink),
      Box(key: _globalKey2, color: Colors.green),
      Box(key: _globalKey3, color: Colors.blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //获取手机是横屏还是竖屏(portrait:竖屏),(landscape:横屏)
    String orientation = MediaQuery.of(context).orientation.name;
    print("横竖屏=${orientation}");
    return Scaffold(
      appBar: AppBar(title: const Text("Key状态管理方法")),
      body: Center(
        //此方法用LocalKey 会丢失状态重新渲染,这里使用了GlobalKey可以不用重新渲染
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
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
