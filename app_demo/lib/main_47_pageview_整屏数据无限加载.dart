import 'package:flutter/material.dart';
import 'package:wechat/screens/page_view_full_screen.dart';


void main()=>runApp(MaterialApp(
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: const PageViewFullScreen(),
));