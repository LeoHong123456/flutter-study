import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  late int sex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
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
                  onChanged: (value)=> print(value)
              ),
              const Gap(8),
              TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "请输入密码",
                  ),
                  onChanged:(value)=> print(value)
              ),
              const Gap(8),
              TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.verified),
                    labelText: "验证码",
                    hintText: "请输入验证码",
                  ),
                  onChanged:(value)=>print(value)
              ),
              const Gap(20),
              const Text("性别"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("男"),
                  Radio(
                      value: 1,
                      groupValue: sex,
                      onChanged:(value){
                        setState(() {
                          sex = value as int;
                        });
                      }
                  ),
                  const Gap(20),
                  const Text("女"),
                  Radio(
                      value: 2,
                      groupValue: sex,
                      onChanged:(value){
                        setState(() {
                          sex = value as int;
                        });
                      }
                  ),
                ],
              ),
              const Gap(50),
              ElevatedButton(onPressed: ()=>Get.toNamed("/profile"), child: const Text("返回首页"))
            ],
          ),
        )
      ),
    );
  }
}
