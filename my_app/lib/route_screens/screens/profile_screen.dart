import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
          backgroundColor: Colors.pink.shade300, title: const Text("我的")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                icon: const Icon(Icons.key),
                label: const Text("登录")),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink.shade300)),
                onPressed: () {
                  Navigator.pushNamed(context, "/registerFirst", arguments: {"name":"张三","age":18,"sex":"男"});
                },
                icon: const Icon(Icons.person_add),
                label: const Text("注册")),
          ],
        ),
      ),
    );
  }
}
