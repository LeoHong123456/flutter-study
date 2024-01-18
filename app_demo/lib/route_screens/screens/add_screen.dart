import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(backgroundColor: Colors.pink.shade300, title: const Text("发布")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("发布作品>>>")
          ],
        ),
      ),
    );
  }
}
