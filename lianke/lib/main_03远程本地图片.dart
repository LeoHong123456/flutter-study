import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("消息",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    wordSpacing: 5,
                    letterSpacing: 5))),
        body: Column(
          children: [
            Image1(),
            //原生组件可以用来做占位作用
            SizedBox(
              height: 20,
            ),
            Image2(),
            Image3(),
            Image4()
          ],
        ),
      ),
    );
  }
}

//加载远程图片
class Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
              color: Color.fromARGB(255, 142, 140, 141), width: 1.0)),
      child: Container(
        width: 200,
        height: 200,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 229, 229, 225)),
        //
        child: Image.network(
          "https://img2.baidu.com/it/u=3596896494,3423896281&fm=253&fmt=auto&app=138&f=JPEG?w=130&h=170",
          //图片缩小
          scale: 2,
          //图片位置显示
          alignment: Alignment.centerLeft,
          //fit 用来控制图片的拉伸和挤压
          //fill：全图显示
          //contain:全图显示原比例
          //cover:显示原比例，可能拉伸可能裁剪
          //fitWidth:宽度充满容器,fitHeight:高度充满容器
          //scaleDown:效果和contain差不多但是此属性不允许显示超过原图片大小
          //repeat: 平铺
          fit: BoxFit.fill,
          //repeat 图片平铺,repeatX,repeatY,noRepeat,
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}

//圆角图片实例一
class Image2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://img2.baidu.com/it/u=520529508,2494878376&fm=253&fmt=auto&app=138&f=JPEG?w=130&h=170"),
          )),
    );
  }
}

//圆角图片实例二
class Image3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipOval(
            child: Image.network(
                "https://img2.baidu.com/it/u=520529508,2494878376&fm=253&fmt=auto&app=138&f=JPEG?w=130&h=170",
                width: 150,
                height: 150,
                fit: BoxFit.cover)));
  }
}

//加载本地图片
class Image4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
        decoration: const BoxDecoration(color: Colors.green),
        child: Image.asset("images/jia1.jpeg", fit: BoxFit.cover));
  }
}
