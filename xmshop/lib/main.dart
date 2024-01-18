import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';

void main() {
  //配置顶部透明状态栏
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
    ScreenUtilInit(
      designSize: const Size(1080,2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          theme: ThemeData(primarySwatch: Colors.grey), //配置主题色（路由返回按钮会跟着变）
          defaultTransition: Transition.rightToLeftWithFade, //配置全局动画效果比如路由切换页面（也可以单个页面配置）
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    )
  );
}
