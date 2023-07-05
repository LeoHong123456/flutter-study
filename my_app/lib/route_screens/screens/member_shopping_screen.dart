import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class MemberShoppingScreen extends StatefulWidget {
  const MemberShoppingScreen({super.key});

  @override
  State<MemberShoppingScreen> createState() => _MemberShoppingScreen();
}

class _MemberShoppingScreen extends State<MemberShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("会员购")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("会员购页>>>")
          ],
        ),
      ),
    );
  }
}
