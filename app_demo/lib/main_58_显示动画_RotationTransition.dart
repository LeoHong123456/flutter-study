import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() => runApp(MaterialApp(
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
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("显示动画_RotationTransition")),
      body: Center(
        child: Column(children: [
          RotationTransition(
            turns: _animationController,
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
