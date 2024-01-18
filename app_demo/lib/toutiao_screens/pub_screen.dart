import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class PubScreen extends StatelessWidget {
  const PubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Text("发布"),
    );
  }
}
