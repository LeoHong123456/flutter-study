import 'dart:math';

import 'package:flutter/Material.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.pink),
  home: const HomePage(),
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //自己创建数据流
  Stream<int> _loadStreamData(){
    return Stream.periodic(const Duration(seconds:1),(value)=>value);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor:Colors.pink.shade300,
        title: const Text("StreamBuilder使用刷新局部组件"),
      ),
      body: Center(
        child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("无数据流。。。");
              case ConnectionState.waiting:
                return const Text("等待中。。。");
              case ConnectionState.active:
                if(snapshot.hasError){
                  return Text("error:$snapshot.error");
                }else{
                  if(snapshot.hasData){
                    return Text("${snapshot.data}", style: Theme.of(context).textTheme.headlineLarge);
                  }else{
                    return const Text("加载中。。。");
                  }
                }
              case ConnectionState.done:
                return const Text("加载完成。。。");
              default:
                throw "ConnectionState Error!";
            }
          }, stream: _loadStreamData(),
        )
      ),
    );
  }
}
