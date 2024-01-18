import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Wrap组件"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onPressed() {
    print(">>>");
  }

  @override
  Widget build(BuildContext context) {
    //Wrap可以实现流式布局，单行的Wrap 跟Row表现几乎一直，单列的Wrap则跟Row表现几乎一致，但是Row与Column都是单行单列的，Wrap则突破了这个限制
    //mainAxis上空间不足时，则向crossAxis上去扩展显示

    //属性介绍：
    //direction 主轴的方向，默认水平
    //alignment 主轴对其方式
    //spacing 主轴方向间距
    //textDirection 文本方向
    //verticalDirection 定义了children摆放顺序，默认是down，见Flex相关属性介绍
    //runAlignment run的对齐方式，run可以理解为新的行或者列，如果是水平方向布局run可以理解为新的一行
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
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
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink.shade200),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
