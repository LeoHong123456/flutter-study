import 'package:flutter/Material.dart';
import 'package:wechat/screens/page_view_screen.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.pink.shade300, centerTitle: true)),
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
      appBar: AppBar(title: const Text("抖音")),
      body: const PageViewScreen(),
    );
  }
}
