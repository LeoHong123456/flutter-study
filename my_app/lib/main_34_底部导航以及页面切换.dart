import 'package:flutter/material.dart';
import 'package:wechat/screens/contact_list_screens.dart';
import 'package:wechat/screens/discover_screens.dart';
import 'package:wechat/screens/me_screens.dart';
import 'package:wechat/screens/wechat_screens.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Widget> _buttonNavigations = [
    const WechatScreen(),
    const ContaceScreen(),
    const DiscoverScreen(),
    const MeScreens()
  ];

  int _selectIndex = 0;

  void _onItemTapped(index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("底部导航")),
      body: _buttonNavigations[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        //图标大小配置
        iconSize: 35,
        //当前默认选项
        currentIndex: _selectIndex,
        //监听事件
        onTap: _onItemTapped,
        //模糊阴影强度
        elevation: 10,
        //选中的Button的Icon以及lable颜色
        fixedColor: Colors.green.shade300,
        //未选中的bar不隐藏标题
        showUnselectedLabels: true,
        //选中的bar不隐藏标题
        showSelectedLabels: true,
        //选中icon颜色设置
        // selectedItemColor: Color.fromARGB(255, 75, 115, 135),
        //未选中颜色设置
        // unselectedItemColor: const Color(0xFF506380),
        //默认是点击bar会有动态效果，设置此属性可以取消动态效果
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wechat,
            ),
            label: "微信",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
            ),
            label: "通讯录",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compass_calibration,
            ),
            label: "发现",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "我",
          ),
        ],
      ),
    );
  }
}
