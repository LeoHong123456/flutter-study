import 'package:flutter/material.dart';
import 'package:wechat/screens/contact_list_screens.dart';
import 'package:wechat/screens/discover_screens.dart';
import 'package:wechat/screens/me_screens.dart';
import 'package:wechat/screens/pub_message_screens.dart';
import 'package:wechat/screens/wechat_screens.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenNumber = 0;

  static final List<Widget> _tappedScreens = [
    const WechatScreen(),
    const ContaceScreen(),
    const PubScreen(),
    const DiscoverScreen(),
    const MeScreens()
  ];

  void _selectedBar(index) {
    setState(() {
      screenNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("浮动导航"),
      ),
      body: _tappedScreens[screenNumber],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 30,
        backgroundColor: Colors.white,
        fixedColor: Colors.pink.shade300,
        unselectedItemColor: Colors.grey.shade600,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: screenNumber,
        onTap: _selectedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: "鱼塘"),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: "发布"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor:
              screenNumber == 2 ? Colors.pink.shade300 : Colors.blue.shade300,
          onPressed: () {
            setState(() {
              screenNumber = 2;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
