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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter 交错式动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller,
              size: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: _controller,
              size: 40,
            ),
            AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _controller,
              size: 40,
            ),
            const Divider(),
            const SizedBox(height: 20),
            //案例一交错式动画
            Stack(
              children: [
                ////0 - .5秒消失，.5 - 1 秒close 显示
                ScaleTransition(
                  scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
                      .chain(CurveTween(curve: const Interval(0.5, 1.0)))),
                  child: const Icon(Icons.close, size: 40),
                ),
                //0 - .5秒消失，.5 - 1 秒close 显示
                ScaleTransition(
                  scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
                      .chain(CurveTween(curve: const Interval(0, 0.5)))),
                  child: const Icon(Icons.search, size: 40),
                ),
              ],
            ),

            // SlideTransition(
            //   position: _controller.drive(Tween(
            //           begin: const Offset(0.0, 0.0),
            //           end: const Offset(1.0, 0.0))
            //       .chain(CurveTween(curve: const Interval(0.0, 0.2)))),
            //   child: Container(
            //     height: 60,
            //     width: 120,
            //     color: Colors.pink,
            //   ),
            // ),

            // SlideTransition(
            //   position: _controller.drive(Tween(
            //           begin: const Offset(0.0, 0.0),
            //           end: const Offset(1.0, 0.0))
            //       .chain(CurveTween(curve: const Interval(0.4, 0.6)))),
            //   child: Container(
            //     height: 60,
            //     width: 120,
            //     color: Colors.pink.shade300,
            //   ),
            // ),

            // SlideTransition(
            //   position: _controller.drive(Tween(
            //           begin: const Offset(0.0, 0.0),
            //           end: const Offset(1.0, 0.0))
            //       .chain(CurveTween(curve: const Interval(0.6, 0.8)))),
            //   child: Container(
            //     height: 60,
            //     width: 120,
            //     color: Colors.pink.shade100,
            //   ),
            // ),

            //封装效果

            SlidingBox(
              controller: _controller,
              color: Colors.pink,
              curve: const Interval(0.0, 0.2),
            ),

            SlidingBox(
              controller: _controller,
              color: Colors.pink.shade300,
              curve: const Interval(0.2, 0.4),
            ),

            SlidingBox(
              controller: _controller,
              color: Colors.pink.shade100,
              curve: const Interval(0.4, 0.6),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
          // _controller.repeat(reverse: true);
        },
      ),
    );
  }
}

class SlidingBox extends StatefulWidget {
  final AnimationController controller;
  final Color color;
  final Curve curve;

  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  State<SlidingBox> createState() => _SlidingBoxState();
}

class _SlidingBoxState extends State<SlidingBox> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: this.widget.controller.drive(
          Tween(begin: const Offset(0.0, 0.0), end: const Offset(1.0, 0.0))
              .chain(CurveTween(curve: this.widget.curve))),
      child: Container(
        height: 60,
        width: 120,
        color: this.widget.color,
      ),
    );
  }
}
