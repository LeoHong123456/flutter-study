import 'package:flutter/material.dart';
import './route_screens/news_screen.dart';
import './route_screens/search_screen.dart';
import './route_screens/form_screen.dart';
import './route_screens/home_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          "/news": (context) => const NewsScreen(title: "新闻"),
          "/form": (context) => const FormScreen(arguments: {"age":18}),
          "/search": (context) => const SearchScreen(),
          "/home": (context) => const HomeScreen()
        },
      ),
    );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
