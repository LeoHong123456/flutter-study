import 'package:flutter/Material.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData.dark(),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int number = 0;

  Future<String>  _loadData() async{
    return Future.value("初始化数据。。。");
  }

  //定义一个异步流
  Stream<int> _loadStreamData(){
    //Duration(seconds: 1),(_)=>42 表示每隔1秒调用(_)=>42, (_)写法是简易写法等同于(value)
    // return Stream.periodic(const Duration(seconds: 1),(_)=>42);

    //const Duration(seconds: 1),(v)=>v) 表示每一秒执行一次，让V+1,默认从0开始
    return Stream.periodic(const Duration(seconds: 1),(v)=>v);
  }

  @override
  void initState() {
    _loadData().then((value)=>print(value));

    //获取异步流里面的数据
    _loadStreamData().listen((event) {
      setState(() {
        number = event;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade200,
        title: const Text("Stream Future 异步获取多个值",style:TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "行书")),
        bottomOpacity: .3,
      ),
      body: Center(
        child: Text("$number", style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
