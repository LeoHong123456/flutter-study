import 'package:flutter/material.dart';
import 'route/routes.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
      home: const HomePage(),
      onGenerateRoute: onGenerateRoute,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("个人中心")),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: const Text("前往登录>>>"),
          ),
        ),
      ),
    );
  }
}
