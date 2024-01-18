import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main()=>runApp(
  MaterialApp(
    theme: ThemeData(primaryColor: Colors.pink, appBarTheme:AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
    home: const HomePage()
  )
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List  _list = [];
  final dio = Dio();
  int page = 1;
  bool flag = true;
  bool hasdata = true;

  _getData() async{
    String url = "https://www.phonegap100.com/appapi.php";
    if(flag && hasdata){
      print("请求接口页码>>>:$page");
      flag = false;
      var params = {"a":"getPortalList", "catid":"20","page": page};
      var response = await dio.get(url,queryParameters: params);
      Map obj = json.decode(response.data);

      setState(() {
        _list.addAll(obj["result"]);
        page++;
        flag = true;
      });

      if(obj["result"].length < 20){
        setState(() {
          hasdata = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();

    //监听滚动条事件
    _scrollController.addListener(() {
      //获取滚动条下拉的高度
      var pixels = _scrollController.position.pixels;
      //获取页面高度
      var maxScrollExtent = _scrollController.position.maxScrollExtent;
      if(pixels > maxScrollExtent-30){
        print("加载更多");
        _getData();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("请求API下拉刷新分页")),
      body: _list.isNotEmpty ? RefreshIndicator(
          child: ListView.builder(
            controller: _scrollController,
              itemCount: _list.length,
              itemBuilder: (context, index){
                if(index == _list.length-1) {
                  return Column(
                    children: [
                      ListTile(title: Text("${_list[index]["title"]}")),
                      const Divider(),
                      _progressIndicator(),
                    ],
                  );
                }else{
                  return Column(
                    children: [
                      ListTile(title: Text("${_list[index]["title"]}")),
                      const Divider(),
                    ],
                  );
                }
            }
          ),
          //下拉刷新
          onRefresh: () async{
            print("下拉刷新");
            _getData();
          }
      ): _progressIndicator(),
    );
  }

  Widget _progressIndicator(){
    if(hasdata){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return const Text("---我是有底线的---");
    }
  }
}


