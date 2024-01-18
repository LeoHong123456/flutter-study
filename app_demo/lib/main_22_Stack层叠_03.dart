import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0x000005)),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(title: Text("Stack-03")),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //可以获取屏幕的宽高
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
            children: const [
              ListTile(title: Text("我是列表1")),
              ListTile(title: Text("我是列表2")),
              ListTile(title: Text("我是列表3")),
              ListTile(title: Text("我是列表4")),
              ListTile(title: Text("我是列表5")),
              ListTile(title: Text("我是列表6")),
              ListTile(title: Text("我是列表7")),
              ListTile(title: Text("我是列表8")),
              ListTile(title: Text("我是列表9")),
              ListTile(title: Text("我是列表10")),
              ListTile(title: Text("我是列表1")),
              ListTile(title: Text("我是列表2")),
              ListTile(title: Text("我是列表3")),
              ListTile(title: Text("我是列表4")),
              ListTile(title: Text("我是列表5")),
              ListTile(title: Text("我是列表6")),
              ListTile(title: Text("我是列表7")),
              ListTile(title: Text("我是列表8")),
              ListTile(title: Text("我是列表9")),
              ListTile(title: Text("我是列表10")),
              ListTile(title: Text("我是列表1")),
              ListTile(title: Text("我是列表2")),
              ListTile(title: Text("我是列表3")),
              ListTile(title: Text("我是列表4")),
              ListTile(title: Text("我是列表5")),
              ListTile(title: Text("我是列表6")),
              ListTile(title: Text("我是列表7")),
              ListTile(title: Text("我是列表8")),
              ListTile(title: Text("我是列表9")),
              ListTile(title: Text("我是列表10")),
            ],
          ),
        ),
        //Positioned组件中如果使用Row, Column 组件一定要设置宽高，不然是不生效的，Container组件中就不需要使用，直接在在container中设置即可
        Positioned(
          left: 0,
          top: 0,
          width: size.width, //没有办法使用double.infinity
          height: 44,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 44,
                  color: Colors.red.shade400,
                  alignment: Alignment.center,
                  child: const Text(
                    "二级导航",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
