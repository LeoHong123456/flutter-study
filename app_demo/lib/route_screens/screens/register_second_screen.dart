import 'package:flutter/material.dart';
import 'package:wechat/route_screens/screens/register_third_screen.dart';
import 'package:wechat/utils/app_styles.dart';

class RegisterSecondScreen extends StatefulWidget {
  final Map arguments;
  const RegisterSecondScreen({super.key, required this.arguments});

  @override
  State<RegisterSecondScreen> createState() => _RegisterSecondScreenState();
}

class _RegisterSecondScreenState extends State<RegisterSecondScreen> {
  final Map paramsMap = {"salary":35000};
  
  @override
  void initState() {
    super.initState();
    print("注册信息第二步：${widget.arguments}");
    paramsMap.addAll(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("注册第二步")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("注册页第二步>>>"),
            const SizedBox(height: 25),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.pink.shade300)),
              //路由替换
                onPressed: ()=> Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext build)=> RegisterThirdScreen(arguments: paramsMap)), (route) => false),
                icon: const Icon(Icons.next_plan),
                label: const Text("下一步")
            )
          ],
        ),
      ),
    );
  }
}
