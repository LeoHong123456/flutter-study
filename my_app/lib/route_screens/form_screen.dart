import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class FormScreen extends StatefulWidget {
  final Map arguments;
  const FormScreen({super.key, required this.arguments});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("首页"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("表单组件>>>"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: const Icon(Icons.search),
              label: const Text("跳转搜索页面"),
            )
          ],
        ),
      ),
    );
  }
}
