import 'package:flutter/material.dart';

class PageViewSwiperScreen extends StatefulWidget {
  const PageViewSwiperScreen({super.key});

  @override
  State<PageViewSwiperScreen> createState() => _PageViewSwiperScreenState();
}

class _PageViewSwiperScreenState extends State<PageViewSwiperScreen> {
  List<Widget> list = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    list  = const [
      ImagePage(src: "images/01.jpeg"),
      ImagePage(src: "images/jia1.jpeg"),
      ImagePage(src: "images/jia2.jpeg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("轮播图")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    _currentIndex = index % list.length;
                  });
                },
                itemCount: 1000,
                itemBuilder: (context, index){
                  //取余实现循环
                  return list[index % list.length];
                },
              )
          ),
          Positioned(
              bottom: 10,
              //left 0 right 0 就会居中，小技巧, Stack 添加aligment.center 也可以实现居中
              // left: 0,
              // right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  List.generate(list.length, (index){
                    return Container(
                      margin: const EdgeInsets.all(5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentIndex == index ? Colors.white : Colors.grey,
                        //方法一实现容易为圆形状
                        //borderRadius: BorderRadius.circular(5),
                        //方法二实现容器为圆形状
                        shape: BoxShape.circle
                      ),
                    );
                  }).toList(),
              ))
        ],
      )
    );
  }
}


//图片组件
class ImagePage extends StatelessWidget {
  final double width;
  final double height;
  final String src;
  const ImagePage({super.key,this.width=double.infinity , this.height=200, required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(src, fit: BoxFit.cover),
    );
  }
}
