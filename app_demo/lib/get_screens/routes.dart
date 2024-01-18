import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import './screens/home_screen.dart';
import './screens/dynamic_screen.dart';
import './screens/add_screen.dart';
import './screens/member_shopping_screen.dart';
import './screens/profile_screen.dart';
import './screens/login_screen.dart';
import './screens/register_second_screen.dart';
import './screens/register_fist_screen.dart';
import './screens/register_third_screen.dart';
import './screens/user_setting_screen.dart';
import './middleware/user_setting_middleware.dart';


class Routes{
  static const  String login= "/login";
  static const String home= "/home";
  static const String dynamic= "/dynamic";
  static const String add= "/add";
  static const String profile = "/profile";
  static const String registerFirst= "/registerFirst";
  static const String registerSecond = "/registerSecond";
  static const String registerThird = "/registerThird";
  static const String memberShopping= "/memberShopping";
  static const String userSettings = "/userSettings";


  static final List<GetPage> getPages = [
    GetPage(name: login, page: ()=>const LoginScreen()),
    GetPage(name: home, page: ()=>const HomeScreen()),
    GetPage(name: dynamic, page: ()=>const DynamicScreen()),
    GetPage(name: add, page: ()=>const AddScreen()),
    GetPage(name: profile, page: ()=>const ProfileScreen()),
    GetPage(name: registerFirst, page: ()=>const RegisterFistScreen()),
    GetPage(name: registerSecond, page: ()=>const RegisterSecondScreen()),
    GetPage(name: registerThird, page: ()=>const RegisterThirdScreen()),
    //transition 添加单个页面跳转路由动画效果
    GetPage(name: memberShopping, page: ()=>const MemberShoppingScreen(),transition: Transition.fade),
    //middlewares 中间件在跳转的过程中可以做校验拦截，支持多个，也可以设置优先级
    GetPage(name: userSettings, middlewares:[UserSettingMiddlleware()], page: ()=>const UserSettingScreen())
  ];
}