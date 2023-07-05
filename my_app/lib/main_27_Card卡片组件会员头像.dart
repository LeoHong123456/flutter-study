import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Card组件图文"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        // padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        children: [
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "images/jia2.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                const ListTile(
                  title: Text("XXXXXX"),
                  subtitle: Text("XXXXXX"),
                  //CircleAvatar 圆形组件，需要配合backgroundImage 使用
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("images/jia1.jpeg"),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  // ClipOval 圆形组件
                  leading: ClipOval(
                    child: Image.network(
                      "https://www.itying.com/images/flutter/3.png",
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  title: Text("XXXXXX"),
                  subtitle: Text("XXXXXX"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
