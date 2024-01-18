import 'dart:async';
import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<String> list;
  const Swiper({super.key, this.width = double.infinity, this.height=200, required this.list});
  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int _currentIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer timer;


  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i<widget.list.length; i++){
      pageList.add(
        ImageScreen(src: widget.list[i])
      );
    }

    _pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 3),(timer){
      _pageController.animateToPage(
          (_currentIndex + 1) % pageList.length,
          //执行时间
          duration: const Duration(milliseconds: 500),
          //线性方式执行
          curve: Curves.linear
      );
    });
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: 300,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index){
                setState(() {
                  _currentIndex = index % pageList.length;
                });
              },
              itemCount: 1000,
              itemBuilder: (context, index){
                //取余实现循环
                return pageList[index % pageList.length];
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
              List.generate(widget.list.length, (index){
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
    );
  }
}



class ImageScreen extends StatelessWidget {
  final double width;
  final double height;
  final String src;
  const ImageScreen({super.key,this.width=double.infinity , this.height=200, required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(src, fit: BoxFit.cover),
    );
  }
}