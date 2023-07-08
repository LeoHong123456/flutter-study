import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
    home: const LayerPopButton(),
  )
);

class LayerPopButton extends StatefulWidget {
  const LayerPopButton({super.key});

  @override
  State<LayerPopButton> createState() => _LayerPopButtonState();
}

class _LayerPopButtonState extends State<LayerPopButton> {

  // 如果想获取返回值需要加上异步async
    void _showPop() async{
        //获取返回值 需要等待方法执行完成
        var result = await showDialog(context: context, builder: (context){
           return AlertDialog(
            title: const Text("提示信息！"),
            content: const Text("您确定要删除吗？"),
            actions: [
              //点击按钮消失页面，以路由返回上一步记录，用于返回值：pop("删除完成")
            TextButton(onPressed: ()=>Navigator.of(context).pop("删除完成"), child: const Text("确定")),
            TextButton(onPressed: ()=>Navigator.of(context).pop("取消成功"), child: const Text("取消"))
            ]);
        });
        print(result);
    }
    
    
    
    void _showSimpleDialog() async {
      //barrierDismissible:true //表示点击灰色背景的时候是否消失弹出框
       var result = await showDialog(context: context, barrierDismissible: false, builder: (context){
        return  SimpleDialog(
          title: const Text("--请选择--"),
          children: [
            SimpleDialogOption(
              child: const Text("语文"),
              onPressed: ()=>Navigator.pop(context,"语文"),
            ),
            const Divider(),
            SimpleDialogOption(
              child: const Text("数学"),
              onPressed: ()=>Navigator.pop(context,"数学"),
            ),
            const Divider(),
            SimpleDialogOption(
              child: const Text("英语"),
              onPressed: ()=>Navigator.pop(context,"英语"),
            ),
            const Divider(),
            SimpleDialogOption(
              child: const Text("物理"),
              onPressed: ()=>Navigator.pop(context,"物理"),
            )
          ],
        );
      });
       print("result=${result}");
    }

    void _toast(){
      //第三方插件
      Fluttertoast.showToast(
          msg: "秒后跳转到指定页面",
          //此参数只在android ，web 中生效，短时间生效
          toastLength: Toast.LENGTH_SHORT,
          //提示时间针对IOS 和WEB
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.pink.shade300,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


    void _modelBottomSheet() async {
      var result = await showModalBottomSheet(context: context, builder: (context){
        return SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              ListTile(title: const Text("分享"),onTap:()=>Navigator.pop(context,"分享")),
              const Divider(),
              ListTile(title: const Text("收藏"),onTap:()=>Navigator.pop(context,"收藏")),
              const Divider(),
              ListTile(title: const Text("取消"),onTap:()=>Navigator.pop(context,"取消")),
              const Divider(),
              ListTile(title: const Text("转发"),onTap:()=>Navigator.pop(context,"转发")),
            ],
          ),
        );
      });
      print("result=${result}");
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("弹出框")),
        body: Center(
            child: Column(
                children: [
                    ElevatedButton(onPressed: _showPop, child: const Text("Dialog弹出窗")),
                    const SizedBox(height: 30),
                    ElevatedButton(onPressed: _showSimpleDialog, child: const Text("select弹出框-SimpleDialog")),
                    const SizedBox(height: 30),
                    ElevatedButton(onPressed: _modelBottomSheet, child: const Text("弹出框-showModeBottomSheet")),
                    const SizedBox(height: 30),
                    ElevatedButton(onPressed: _toast, child: const Text("弹出框-toast")),
                ],
            ),
        ),
    );
  }
}

