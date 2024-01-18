import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: const Center(
        child: Text("发现"),
      ),
    );
  }
}
