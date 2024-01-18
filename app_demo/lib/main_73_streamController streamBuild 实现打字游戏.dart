import 'dart:async';
import 'dart:math';
import 'package:flutter/Material.dart';

void main()=>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<int> _inputController = StreamController.broadcast();
  final StreamController<int> _scoreController = StreamController.broadcast();
  int totalScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.pink.shade300,
        title: StreamBuilder(
          stream: _scoreController.stream,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            if(snapshot.hasData){
              totalScore = snapshot.data! + totalScore;
              return Text("积分：${totalScore}");
            }
            return const Text("监听中。。。");
          },
        ),
      ),
      body: Stack(
        children: [
          //循环三次生成Game组件
          ...List.generate(4, (index){
            return Game(inputController: _inputController,scoreController: _scoreController);
          }),
          KeyPad(inputController: _inputController),
        ],
      )
    );
  }
}


//监听键盘组件
class KeyPad extends StatelessWidget {
  final StreamController<int> inputController;
  const KeyPad({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.count(
        //收缩
        shrinkWrap: true,
        crossAxisCount: 3,
        //该组件屏幕比率
        childAspectRatio: 5/2,
        children: List.generate(9, (index){
          return TextButton(
              style: ButtonStyle(
                //去除圆角
                shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
                backgroundColor: MaterialStateProperty.all(Colors.primaries[index][300]),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){
                inputController.add(index+1);
              },
              child: Text("${index+1}", style: Theme.of(context).textTheme.headlineLarge,)
          );
        }),
      ),
    );
  }
}


class Game extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;
  const Game({super.key, required this.inputController, required this.scoreController});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late int a, b;
  late double x;
  late Color color;

  void reset(){
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 320;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  void initState() {
    super.initState();
    //重置动画
    reset();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: Random().nextInt(5000)+5000));
    _animationController.forward();//执行一次动画

    //监听动画执行完成
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        //生成随机数
        reset();
        //重新执行动画
        _animationController.forward(from: 0.0);
      }
    });


    //监听键盘值
    widget.inputController.stream.listen((event) {
      if(a+b == event){
        reset();
        _animationController.forward(from:0.0);
        widget.scoreController.add(1); //结果正常加分
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    //获取屏幕高度
    double height = MediaQuery.of(context).size.height - 200;
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child){
          return Positioned(
            top: Tween(begin: -50.0, end: height).animate(_animationController).value,
            left: x,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("$a + $b = ?", style: const TextStyle(fontSize: 20,)),
            ),
          );
        }
    );
  }
}

