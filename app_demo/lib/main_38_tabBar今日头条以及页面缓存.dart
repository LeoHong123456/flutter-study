import 'package:flutter/material.dart';
import 'package:wechat/toutiao_screens/dynamic_screen.dart';
import 'package:wechat/toutiao_screens/home_screen.dart';
import 'package:wechat/toutiao_screens/member_shopping.dart';
import 'package:wechat/toutiao_screens/pub_screen.dart';
import 'package:wechat/toutiao_screens/me_screen.dart';
import 'package:wechat/utils/keep_alive_wrapper.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> screenList = const [
    HomeScreen(),
    DyNamicScreen(),
    PubScreen(),
    MemberShoppingScreen(),
    MeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
        backgroundColor: Colors.green.shade300,
        title: const Text("头条首页"),
        centerTitle: true,
      ),
      body: screenList[currentIndex],
      floatingActionButton: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(left: 8, right: 8, top: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.pink.shade300,
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        iconSize: 35,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.pink.shade300,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.wind_power), label: "动态"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "发布"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "会员购"),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv_off_rounded), label: "我的"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
