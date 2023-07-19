import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        //让程序和手机的刷新频率统一
        vsync: this,
        //透明度从0.5到1过度区间
        lowerBound: .5,
        upperBound: 1,
        duration: const Duration(seconds: 1));
    // 表示重复执行动画
    // ..repeat(reverse: true);
    //可以对动画添加监听
    _animationController.addListener(() {
      print(_animationController.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("显示动画_FadeTransition")),
      body: Center(
        child: Column(children: [
          //动画平移
          SlideTransition(
            //写法一
            position: Tween(begin: const Offset(0, 0), end: const Offset(.1, 2))
                //修改动画效果
                .chain(CurveTween(curve: Curves.bounceIn))
                //交叉动画，当前时间的百分之20 到当前时间的百分之80
                .chain(CurveTween(curve: const Interval(0.2, .8)))
                .animate(_animationController),
            //写法二
            // position: _animationController.drive(
            //   //Offset(0.5, 0) 表示移动自身大小的一半
            //   Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0)),
            // ),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.pink,
            ),
          ),
          FadeTransition(
            opacity: _animationController,
            child: const FlutterLogo(
              size: 80,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _animationController.forward(),
                child: const Text("Forward"),
              ),
              const Gap(8),
              ElevatedButton(
                onPressed: () => _animationController.stop(),
                child: const Text("stop"),
              ),
              const Gap(8),
              ElevatedButton(
                onPressed: () => _animationController.reset(),
                child: const Text("reset"),
              ),
              const Gap(8),
              ElevatedButton(
                onPressed: () => _animationController.reverse(),
                child: const Text("reverse"),
              ),
              const Gap(8),
              ElevatedButton(
                onPressed: () => _animationController.repeat(),
                child: const Text("repeat"),
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          // _animationController.forward();
          // _animationController.stop();
          // _animationController.reset();
          // _animationController.reverse();
          _animationController.repeat();
        },
      ),
    );
  }
}
