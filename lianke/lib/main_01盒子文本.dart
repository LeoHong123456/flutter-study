import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.green),
        home: Scaffold(
            appBar: AppBar(
                centerTitle: true, //文字居中
                title: const Text(
                  "消息",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
            //程序主体部分
            body: Column(children: [WeChat(), MyText(), MyButton()])));
  }
}

class WeChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 1000,
        //容器内元元素居中
        alignment: Alignment.topLeft,
        //设置容器颜色，BoxDecoration不能同时存在
        // color: Colors.grey.shade600,
        //设置容器内边距
        padding: EdgeInsets.all(8),
        //设置容器外边距
        margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
        //transform (XYZ)位移
        transform: Matrix4.translationValues(0, 0, 0), //(X,Y,Z)位移
        // transform: Matrix4.skew(0.1, 0), //倾斜
        //容器装饰(颜色配置)
        decoration: BoxDecoration(
            //背景颜色
            // color: Colors.black26,
            //边框设置
            border: Border.all(color: Colors.red, width: 1),
            //边框圆角
            borderRadius: BorderRadius.circular(8),
            //容器Z轴旋转
            // transform: Matrix4.rotationZ(0.1),
            //设置盒子阴影
            boxShadow: [
              BoxShadow(
                  //阴影颜色
                  color: Colors.green,
                  //偏移量
                  offset: Offset(-5, -5),
                  //传播半径
                  spreadRadius: 1,
                  //阴影强度
                  blurRadius: 15),
            ],
            //背景线性渐变:LinearGradient，径向渐变:GadialGradient
            gradient: LinearGradient(
                begin: Alignment.topLeft, //起始位置
                end: Alignment.bottomRight, //结束位置
                colors: [Colors.green, Colors.yellow])),
        child:
            Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)));
  }
}

//按钮组件
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 40,
        alignment: Alignment.center,
        // margin: EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Text("确认",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800)));
  }
}

//文本修饰组件
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
            "父帅。”她坐到床头，落泪道，“要不我回京请个太医来，或许太医会有办法？”,他笑了笑，柔声道：“生死有命，何必强求呢，如今我唯一放不下就是你了。”爹。”她不知说什么好。老元帅指了指桌案上的一堆信函",
            //文字两端对齐
            textAlign: TextAlign.justify,
            //文本方向从左至右
            textDirection: TextDirection.ltr,
            //文字超出屏幕处理方式（clip:裁减，fade:渐隐，ellipsis:显示省略号）
            overflow: TextOverflow.ellipsis,
            //最大显示行数
            maxLines: 3,
            style: TextStyle(
                //文字颜色
                color: Colors.black38,
                //文字大小
                fontSize: 16,
                //文字加粗
                fontWeight: FontWeight.w900,
                //文字样式斜体
                fontStyle: FontStyle.italic,
                //文字间隙
                letterSpacing: 2,
                //单词间隙
                wordSpacing: 2,
                //文字装饰线（underline:下滑线）
                decoration: TextDecoration.underline,
                //文字装饰颜色
                decorationColor: Colors.black38,
                //文字先装饰风格（dashed:虚线，dotted：实线，double:双实线...）
                decorationStyle: TextDecorationStyle.dashed)));
  }
}
