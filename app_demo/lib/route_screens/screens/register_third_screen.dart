import 'package:flutter/Material.dart';
import './bottom_bar.dart';
import 'package:wechat/utils/app_styles.dart';

class RegisterThirdScreen extends StatefulWidget {
  final Map arguments;
  const RegisterThirdScreen({super.key, required this.arguments});

  @override
  State<RegisterThirdScreen> createState() => _RegisterThirdScreenState();
}

class _RegisterThirdScreenState extends State<RegisterThirdScreen> {

  @override
  void initState() {
    super.initState();
    print("注册第三步：${widget.arguments}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("注册第三步")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("注册页第三步>>>"),
            const SizedBox(height: 25),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed:()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(BuildContext build)=>const BottonBar(index: 4)), (route) => false),
                icon: const Icon(Icons.back_hand),
                label: const Text("返回首页")
            )
          ],
        ),
      ),
    );
  }
}
