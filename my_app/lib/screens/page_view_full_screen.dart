import 'package:flutter/material.dart';

class PageViewFullScreen extends StatefulWidget {
  const PageViewFullScreen({super.key});

  @override
  State<PageViewFullScreen> createState() => _PageViewFullScreenState();
}

class _PageViewFullScreenState extends State<PageViewFullScreen> {
  final List<Widget> initData = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0;i<10; i++){
      initData.add(Center(
        child: Text("第${i+1}屏", style: const TextStyle(fontSize: 60))
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FullPage无限加载数据"),),
      body: PageView(
        onPageChanged: (index){
          print("index=${index}");
          //当滑动到第九页的时候，增加数据
          if(index+2 == initData.length) {
            //重新设置状态，重新渲染页面
            setState(() {
              for (int i = 0; i < 10; i++) {
                initData.add(Center(
                    child: Text(
                        "第${i + 1}屏", style: const TextStyle(fontSize: 60))
                ));
              }
            });
          }
        },
        children: initData,
      ),
    );
  }
}

