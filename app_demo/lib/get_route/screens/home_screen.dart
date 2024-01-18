import 'package:flutter/material.dart';
import 'package:app_demo/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: const Text("首页"),
        actions: [
          IconButton(
            onPressed: ()=>print("搜索>>"),
            icon: const Icon(Icons.search)
          ),
          IconButton(
              onPressed: ()=>print("更多>>"),
              icon: const Icon(Icons.more_horiz)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("首页>>>")
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child:Column(
          children: [
            Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/jia2.jpeg"),
                      ),
                    ),
                    accountName: Text("Leo"),
                    accountEmail: Text("abcdee@gmail.com"),
                    //当前头像
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("images/01.jpeg")),
                    //其他子头像可以放多个
                    otherAccountsPictures: [
                      CircleAvatar(
                          backgroundImage: AssetImage("images/01.jpeg")),
                      CircleAvatar(
                          backgroundImage: AssetImage("images/01.jpeg")),
                      CircleAvatar(
                          backgroundImage: AssetImage("images/01.jpeg")),
                    ],
                  ),
                )
              ],
            ),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("个人中心"),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("系统设置"),
            ),
            const Divider(),
          ],
        ),
      )
    );
  }
}
