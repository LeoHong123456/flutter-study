//android ios 路由切换通用动态效果
import 'package:flutter/cupertino.dart';
import 'package:wechat/route_screens/screens/add_screen.dart';
import 'package:wechat/route_screens/screens/dynamic_screen.dart';
import 'package:wechat/route_screens/screens/home_screen.dart';
import 'package:wechat/route_screens/screens/login_screen.dart';
import 'package:wechat/route_screens/screens/member_shopping_screen.dart';
import 'package:wechat/route_screens/screens/profile_screen.dart';
import 'package:wechat/route_screens/screens/register_fist_screen.dart';
import 'package:wechat/route_screens/screens/register_second_screen.dart';
import 'package:wechat/route_screens/screens/register_third_screen.dart';
import 'package:wechat/screens/hero_screen.dart';
import 'package:wechat/screens/photo_view_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => HomeScreen(),
  "/home": (context) => HomeScreen(),
  "/dynamic": (context) => DynamicScreen(),
  "/add": (context) => AddScreen(),
  "/memberShopping": (context) => MemberShoppingScreen(),
  "/profile": (context) => ProfileScreen(),
  "/login": (context) => LoginScreen(),
  "/registerFirst": (context, {arguments}) =>
      RegisterFistScreen(arguments: arguments),
  "/registerSecond": (context, {arguments}) =>
      RegisterSecondScreen(arguments: arguments),
  "/registerThird": (context, {arguments}) =>
      RegisterThirdScreen(arguments: arguments),
  "/hero": (context, {arguments}) => HeroScreen(arguments: arguments),
  "/photoView": (context, {arguments}) => PhotoViewScreen(arguments: arguments),
};

var onGenerateRoute = (settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  //路由不能为空
  if (pageContentBuilder != null) {
    //校验参数是否为空（有参数的路由走有参数的，没有参数的走没有参数的路由）
    if (settings.arguments != null) {
      return CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    } else {
      return CupertinoPageRoute(
          builder: (context) => pageContentBuilder(context));
    }
  }
};
