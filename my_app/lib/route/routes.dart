import 'package:flutter/material.dart';
import '../route_screens/form_screen.dart';
import '../route_screens/home_screen.dart';
import '../route_screens/news_screen.dart';
import '../route_screens/search_screen.dart';

//定义路由
final Map<String, WidgetBuilder> routesMap = {
  "/": (context) => const HomeScreen(),
  "/news": (context) => const NewsScreen(title: "新闻"),
  "/form": (context, {arguments}) => FormScreen(arguments: arguments),
  "/search": (context) => const SearchScreen(),
  "/home": (context) => const HomeScreen()
};


var onGenerateRoute = (settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routesMap[name];
  //路由不能为空
  if (pageContentBuilder != null) {
    //校验参数是否为空（有参数的路由走有参数的，没有参数的走没有参数的路由）
    if (settings.arguments != null) {
      return MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    }
  }
};