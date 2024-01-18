import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()=>runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              _alertDialog(context);
            }, child: const Text("Flutter 默认Dialog")),


            ElevatedButton(onPressed: (){
              Get.defaultDialog(
                title: "提示信息",
                middleText: "您确定要删除吗？",
                confirm: ElevatedButton(onPressed: (){
                  print("确定");
                  Get.back();
                }, child: const Text("确定")),
                cancel: ElevatedButton(onPressed: (){
                  print("取消");
                  Get.back();
                }, child: const Text("取消")),
              );
            }, child: const Text("GetX 默认Dialog")),

            ///提示信息
            ElevatedButton(onPressed: (){
              Get.snackbar("提示！", "您还没有登录", snackPosition: SnackPosition.TOP);
            }, child: const Text("GetX snackbar")),

            //修改主题BottomSheet
            ElevatedButton(onPressed: (){
              Get.bottomSheet(
                Container(
                  height: 200,
                  color: Get.isDarkMode? Colors.black: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(Icons.wb_sunny_outlined, color: Get.isDarkMode? Colors.white: Colors.black26),
                          title: Text("级炫白", style: TextStyle(color: Get.isDarkMode? Colors.white: Colors.black)),
                          onTap: (){
                            //修改主题
                            Get.changeTheme(ThemeData.light());
                            Get.back();
                      }),
                      ListTile(
                        leading: Icon(Icons.wb_sunny_sharp, color: Get.isDarkMode ? Colors.white: Colors.black26),
                        title: Text("炫酷黑", style: TextStyle(color: Get.isDarkMode ? Colors.white: Colors.black)),
                        onTap: (){
                          //修改主题
                          Get.changeTheme(ThemeData.dark());
                          Get.back();
                      },),
                    ],
                  ),
                )
              );
            }, child: const Text("GetX bottomSheet切换主题")),
          ],
        ),
      ),
    );
  }

  void _alertDialog(context) async{
    var result = await showDialog(
        //表示点击灰色背景的时候是否消失弹出框
        barrierDismissible: false,
        context: context,
        builder:(context){
          return AlertDialog(
            title: const Text("提示信息！"),
            content: const Text("您确定要删除吗？"),
            actions: [
              TextButton(onPressed: (){
                print("ok");
                Navigator.of(context).pop("ok");
              }, child: const Text("确定")),

              TextButton(onPressed: (){
                print("cancel");
                Navigator.of(context).pop("cancel");
              }, child: const Text("取消")),
            ],
          );
        }
    );
    print("result:$result");
  }
}
