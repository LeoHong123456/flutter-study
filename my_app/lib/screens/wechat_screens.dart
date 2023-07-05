import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class WechatScreen extends StatelessWidget {
  const WechatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Center(
        child: Text("微信"),
      ),
    );
  }
}
