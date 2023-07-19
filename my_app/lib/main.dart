import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
      home: const HomePage(),
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
      appBar: AppBar(title: const Text("表单组件")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            children: [
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  //添加边框
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //提示语
                  hintText: "请输入用户名",
                ),
              ),
              /********************************** */
              const Gap(10),
              TextField(
                //密码类型文本
                obscureText: true,
                decoration: InputDecoration(
                  icon: const Icon(Icons.lock_clock_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "请输入密码",
                ),
              ),
              /********************************** */
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  prefixText: "https://",
                  prefixIcon: const Icon(Icons.lock),
                  icon: const Icon(Icons.palette),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "请输入网址",
                ),
              ),
              /********************************** */
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  icon: const Icon(Icons.lock_clock_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "关键词",
                ),
              ),

              /********************************** */
              const Gap(10),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  icon: const Icon(Icons.add_reaction),
                  hintText: "地址详情",
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(20),
              Container(
                width: double.infinity,
                height: 40,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("提交")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
