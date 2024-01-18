import 'dart:async';
import 'package:flutter/Material.dart';

void main()=>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home:HomePage(),
));



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //只支持单个监听者
  // final _controller = StreamController();
  //支持多个监听者
  final _controller = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _controller.stream.listen((event)=>print(event));
  }

  @override
  void dispose() {
    super.dispose();
    //关闭流,一般在组件销毁关闭流
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("StreamController使用"),
        backgroundColor:Colors.pink.shade300,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                // stream: _controller.stream.where((event) => event>2).map((event) => event*2), //表示配置流,where可以过滤条件，也可以通过map方法进行修改
                stream: _controller.stream,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return const Text("数据流已关闭");
                  }
                  if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  if(snapshot.hasData){
                    return Text("${snapshot.data}",style: Theme.of(context).textTheme.headlineLarge);
                  }
                  return const CircularProgressIndicator();
                }
            ),
            const SizedBox(height:40),
            const Divider(color: Colors.pink,),
            ElevatedButton(onPressed: (){
              _controller.add(1); //可以给流中添加数据
            }, child: const Text("event-1")),
            const SizedBox(height:20),
            ElevatedButton(onPressed: (){
              _controller.add(2);
            }, child: const Text("event-2")),
            const SizedBox(height:20),
            ElevatedButton(onPressed: (){
              _controller.add(3);
            }, child: const Text("event-3")),
            const SizedBox(height:20),
            ElevatedButton(onPressed: (){
              _controller.add(4);
            }, child: const Text("event-4")),
            ElevatedButton(onPressed:(){
              _controller.addError("this is Error");
            }, child: const Text("Error")),
            ElevatedButton(onPressed: (){
              _controller.close();
            }, child: const Text("Close Stream"))
          ],
        ),
      )
    );
  }
}
