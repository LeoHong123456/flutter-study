import 'package:flutter/material.dart';
import 'package:app_demo/utils/app_styles.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map params = {"channel":"APP"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("我的")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed: ()=> Get.toNamed("/login"),
                icon: const Icon(Icons.key),
                label: const Text("登录")),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed: ()=>Get.toNamed("/registerFirst", arguments: params),
                icon: const Icon(Icons.person_add),
                label: const Text("注册")),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed: ()=>Get.toNamed("/userSettings", arguments: params),
                icon: const Icon(Icons.person_add),
                label: const Text("修改个人信息")),
          ],
        ),
      ),
    );
  }
}
