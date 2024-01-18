import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade500),
  ),
    home: const HomePage()
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  Future<int> getNum(){
    print("方法运行中");
    return Future((){
      return Future.delayed(const Duration(seconds: 3),(){return 123;});
    });
  }

  //异步
  Future<String> getStringNumber(){
    return Future((){
      //执行统计任务
      int number = 0;
      for(var i = 0;i< 10000;i++){
        number +=1;
      }
      //1、return Future.value("Future正常返回>>>");
      //2、return Future.delayed(const Duration(seconds: 3),(){return "延迟三秒返回>>>";});
      //3、return Future((){ return "返回一个方法";});
      // return Future.error(Exception("抛出异常>>>"));
      return Future.delayed(const Duration(seconds: 3),(){return "延迟三秒返回>>>";});
    });
  }

  Future<int> errorInfo(){
    // return Future.error(Exception("系统异常！"));
    return Future.value(123);
  }

  // async 表示异步方法
  void _incrementCount() async{
    //把异步改成同步
/*    var result = await getNum().then((value){
      return value * 2;
    }).then((value){
      print("value: $value");
    }).catchError((error){
      print(error);
    }).whenComplete((){
      print("操作完成>>>");
    });*/

/*    print("程序开始运行");
    //await 必须用在async方法中
    var result = await getNum();
    print(result);*/



    try{
      var result = await errorInfo();
      print(result);
    }catch(e){
      print(e);
    }

/*    getStringNumber()
        .then((value){
            print(value);
          })
        .catchError((error){
          print(error);
        })
        .whenComplete(() => print("执行完成>>>"));*/

    setState((){
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Future异步")),
      body: Container(
        height: 200,
        width: 1000,
        //容器内元元素居中
        alignment: Alignment.center,
        //设置容器内边距
        padding: const EdgeInsets.all(8),
        //设置容器外边距
        margin: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
        //transform (XYZ)位移
        transform: Matrix4.translationValues(0, 0, 0), //(X,Y,Z)位移
        decoration: BoxDecoration(
          color: Colors.pink.shade400
        ),
       child: Text("$_count", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor:Colors.blue,
          onPressed: _incrementCount,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}



