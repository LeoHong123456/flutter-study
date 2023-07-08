import 'package:flutter/material.dart';
import './screens/page_view_swiper_screen.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const PageViewSwiperScreen(),
));