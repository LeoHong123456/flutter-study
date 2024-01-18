import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_route/routes.dart';
import 'get_route/screens/bottom_bar.dart';


void main()=>runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  getPages: Routes.getPages,
  //修改路由跳转动画效果
  defaultTransition: Transition.circularReveal,
  home: const BottonBar(),
));
