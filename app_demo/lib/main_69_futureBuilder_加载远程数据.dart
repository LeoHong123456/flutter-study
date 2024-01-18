import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme:ThemeData(primaryColor: Colors.pink),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> _loadData() async{
    await Future.delayed(const Duration(seconds: 3));
    //模拟出错
    // int a = (0/1) as int;
    return "远程返回数据>>>";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('FutureBuilder'), backgroundColor: Colors.pink.shade300),
      body: Center(
        child: FutureBuilder(
            //远程数据
            future: _loadData(),
            //初始化数据
            initialData: "初始化数据...",
            builder: (context, snapshot){
              // //可以通过snapshot 获取FutureBuilder 状态，waiting，done 来判断要不要执行下一步，或者执行哪个逻辑
              // if(snapshot.connectionState == ConnectionState.waiting){
              //   return const CupertinoActivityIndicator(radius:20);
              // }else if(snapshot.connectionState == ConnectionState.done){
              //   //获取返回数据
              //   if(snapshot.hasError){
              //     return Text("Error:${snapshot.error}");
              //   }else{
              //     return Text("${snapshot.data}");
              //   }
              // }
              // return const Text("我是Futurebuilder");

          if(snapshot.hasError){
            return Text("Error:${snapshot.error}");
          }else{
            return Text("Data:${snapshot.data}");
          }
        }),
      )
    );
  }
}
