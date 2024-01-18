import 'package:flutter/material.dart';
import 'package:app_demo/route_screens/screens/add_screen.dart';
import 'package:app_demo/route_screens/screens/dynamic_screen.dart';
import 'package:app_demo/route_screens/screens/home_screen.dart';
import 'package:app_demo/route_screens/screens/member_shopping_screen.dart';
import 'package:app_demo/route_screens/screens/profile_screen.dart';
import '../../utils/app_styles.dart';

class BottonBar extends StatefulWidget {
  final int index;
  const BottonBar({super.key, this.index=0});
  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int currentIndex = 0;

  void _onItemTapped(index){
    setState(() {
      currentIndex = index;
    });
    print("当前指针：${currentIndex}");
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  final List<Widget> screens = const [
    HomeScreen(),
    DynamicScreen(),
    AddScreen(),
    MemberShoppingScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: screens[currentIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 3,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: Colors.pink.shade300,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.wind_power),label: "动态"),
            BottomNavigationBarItem(icon: Icon(Icons.add),label: "发布"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "会员购"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "我的"),
          ],
        )
      );
  }
}
