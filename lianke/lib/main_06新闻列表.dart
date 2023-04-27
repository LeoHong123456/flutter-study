import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("新闻"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              trailing: Image.network(
                  "https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2023%2F0427%2F3359c34ap00rtr4h5001xc0009c0070c.png&thumbnail=330x2147483647&quality=75&type=webp"),
              title: Text("驻日美军F-15战斗机群撤离 媒体：\"威慑中国\"时代结束"),
            ),
            Divider(),
            ListTile(
              trailing: Image.network(
                  "https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2023%2F0427%2F3359c34ap00rtr4h5001xc0009c0070c.png&thumbnail=330x2147483647&quality=75&type=webp"),
              title: Text("驻日美军F-15战斗机群撤离 媒体：\"威慑中国\"时代结束"),
            ),
            Divider(),
            ListTile(
              trailing: Image.network(
                  "https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2023%2F0427%2F3359c34ap00rtr4h5001xc0009c0070c.png&thumbnail=330x2147483647&quality=75&type=webp"),
              title: Text("驻日美军F-15战斗机群撤离 媒体：\"威慑中国\"时代结束"),
            ),
            Divider(),
            ListTile(
              trailing: Image.network(
                  "https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2023%2F0427%2F3359c34ap00rtr4h5001xc0009c0070c.png&thumbnail=330x2147483647&quality=75&type=webp"),
              title: Text("驻日美军F-15战斗机群撤离 媒体：\"威慑中国\"时代结束"),
            ),
            Divider(),
            ListTile(
              trailing: Image.network(
                  "https://nimg.ws.126.net/?url=http%3A%2F%2Fcms-bucket.ws.126.net%2F2023%2F0427%2F3359c34ap00rtr4h5001xc0009c0070c.png&thumbnail=330x2147483647&quality=75&type=webp"),
              title: Text("驻日美军F-15战斗机群撤离 媒体：\"威慑中国\"时代结束"),
            ),
            Divider(),
          ],
        ));
  }
}
