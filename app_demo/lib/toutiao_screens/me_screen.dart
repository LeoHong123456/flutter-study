import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Text("我的"),
    );
  }
}
