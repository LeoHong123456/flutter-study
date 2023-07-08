import 'package:flutter/material.dart';
import './utils/my_dialog.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: AppBarTheme(centerTitle: true,color: Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _myDialog() async{
    var result = await showDialog(context: context,barrierDismissible: false, builder: (context){
      return MyDialog(
        title: "提示信息",
        content: "内容区",
        onTap: ()=> Navigator.pop(context, "取消")
      );
    });
    print("result=${result}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("自定义Dialog")),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _myDialog, child: const Text("自定义-lDialog"))
            ],
          ),
        ),
      )
    );
  }
}
