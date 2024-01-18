import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
  String varcode = "";
  late TextEditingController _varCodeController;

  @override
  void initState() {
    super.initState();
    //表单初始化值
    _varCodeController = TextEditingController.fromValue(TextEditingValue(
      text: '5625',
      //flutter 3.X 无需配置selection 属性
      selection:
          TextSelection.fromPosition(TextPosition(offset: varcode.length)),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _varCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "用户名",
                  hintText: "请输入用户名",
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              const Gap(8),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "请输入密码",
                ),
                onChanged: (value) {
                  password = value;
                  // setState(() {
                  //   password = value;
                  // });
                },
              ),
              const Gap(8),
              TextField(
                controller: _varCodeController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.verified),
                  labelText: "验证码",
                  hintText: "请输入验证码",
                ),
                onChanged: (value) {
                  varcode = value;
                  // setState(() {
                  //   password = value;
                  // });
                },
              ),
              const Gap(80),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    print(
                        "username=$username,password=$password,varcode=$varcode");
                  },
                  child: const Text("登录"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
