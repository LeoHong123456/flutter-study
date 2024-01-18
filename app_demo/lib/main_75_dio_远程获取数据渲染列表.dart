import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const HomePage()
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
      //Map convert to json
      Map userInfo = {"username":"张三","age": 18};
      String encode = json.encode(userInfo);
      print("encode: $encode");

      //json String convert to Map
      Map decode = json.decode(encode);
      print("decode: $decode");

  }

  final dio = Dio();
  Future<List> _get() async{
    var params = {"username":"张三","age": 18,"sex": "男"};
    final response = await dio.get('https://jdmall.itying.com/api/pcate', queryParameters: params);
    print(response.data);
    return response.data["result"];
  }

  void _post() async{
    var params = {"username":"张三","age": 18,"sex": "男"};
    var response = await dio.post('https://jdmall.itying.com/api/httpPost', data: params);
    print(response);
  }

  void _put() async{
    var params = {"username":"张三","age": 18,"sex": "男"};
    var response = await dio.put('https://jdmall.itying.com/api/httpPut', data: params);
    print(response);
  }

  void _delete() async{
    var params = {"username":"张三","age": 18,"sex": "男"};
    var response = await dio.delete('https://jdmall.itying.com/api/httpDelete', data: params);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("网络请求")),
      body: FutureBuilder(
        future: _get(),
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text("Error:${snapshot.error}")
              );
            }else{
              var list = snapshot.data as List;
              return ListView(
                children: list.map((e){
                  return Column(
                    children: [
                      ListTile(title: Text("${e["title"]}")),
                      const Divider()
                    ],
                  );
                }).toList(),
              );
            }
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}
