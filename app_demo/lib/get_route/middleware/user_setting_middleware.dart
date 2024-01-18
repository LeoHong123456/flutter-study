import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserSettingMiddlleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    print("========>$route");
    return null; //跳转到以前的路由
  }
}