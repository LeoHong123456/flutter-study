import 'package:flutter/Material.dart';
import 'package:wechat/utils/app_styles.dart';

class RegisterFistScreen extends StatefulWidget {
  final Map arguments;
  const RegisterFistScreen({super.key, required this.arguments});

  @override
  State<RegisterFistScreen> createState() => _RegisterFistScreenState();
}

class _RegisterFistScreenState extends State<RegisterFistScreen> {
  late  Map paramsMap = {"job": "Flutter工程师"};
  @override
  void initState() {
    super.initState();
    print("注册信息第一步：${widget.arguments}");
    paramsMap.addAll(widget.arguments);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("注册第一步")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("注册第一步>>>"),
            const SizedBox(height: 25),
            ElevatedButton.icon(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.pink.shade300)),
                icon: const Icon(Icons.next_plan),
                label: const Text("下一步"),
                onPressed: (){
                  Navigator.pushNamed(context, "/registerSecond", arguments: paramsMap);
                }
            )
          ],
        ),
      ),
    );
  }
}
