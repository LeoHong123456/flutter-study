import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AppLayout{
  static getSize(BuildContext context){
    // final size = AppLayout.getSize(context);
    // return MediaQuery.of(context).size.width,
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(){
    return Get.height;
  }

  static getScreenWidth(){
    return Get.width;
  }

  //根据这个可以解决高度溢出问题
  static getHeight(double pixels){
    //获取屏幕高端 / 组件高度
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  //根据这个可以解决宽度溢出问题
  static getWidth(double pixels){
    //获取屏幕宽度端 / 组件宽度
    double y = getScreenWidth() / pixels;
    return getScreenWidth() / y;
  }
}