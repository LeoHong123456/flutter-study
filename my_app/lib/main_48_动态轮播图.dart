import 'package:flutter/material.dart';
import 'package:wechat/screens/animate_swiper_screen.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true,color: Colors.pink.shade300)),
  home: const AnimateSwiperScreen(),
));