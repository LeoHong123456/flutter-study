import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Card卡片组件使用"),
          ),
          body: const HomePage(),
        ),
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Card(
            //阴影深度
            elevation: 5,
            color: Colors.green.shade300,
            //阴影颜色
            shadowColor: Colors.red.shade600,
            //配置圆角形状
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //外边距
            margin:
                const EdgeInsets.only(top: 10, bottom: 0, left: 8, right: 8),
            child: Column(
              children: const [
                ListTile(
                  title: Text("张三", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                //分割线
                Divider(),
                ListTile(
                  title: Text("电话： 131256644445"),
                ),
                ListTile(
                  title: Text("地址：北京海淀"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            //阴影深度
            elevation: 5,
            color: Colors.yellow.shade300,
            //阴影颜色
            shadowColor: Colors.red.shade600,
            //外边距
            margin:
                const EdgeInsets.only(top: 10, bottom: 0, left: 8, right: 8),
            //配置圆角形状
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: const [
                ListTile(
                  title: Text("李四", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                //分割线
                Divider(),
                ListTile(
                  title: Text("电话： 131256644445"),
                ),
                ListTile(
                  title: Text("地址：北京海淀"),
                ),
              ],
            ),
          ),
          Card(
            //阴影深度
            elevation: 5,
            color: Colors.grey.shade400,
            //阴影颜色
            shadowColor: Colors.red.shade600,
            //外边距
            margin:
                const EdgeInsets.only(top: 10, bottom: 0, left: 8, right: 8),
            //配置圆角形状
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: const [
                ListTile(
                  title: Text("李四", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                //分割线
                Divider(),
                ListTile(
                  title: Text("电话： 131256644445"),
                ),
                ListTile(
                  title: Text("地址：北京海淀"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
