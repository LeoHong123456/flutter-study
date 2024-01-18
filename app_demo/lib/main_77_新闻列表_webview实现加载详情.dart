import 'package:flutter/material.dart';
import './route/news_routes.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme:ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  onGenerateRoute: onGenerateRoute,
  initialRoute: "/",
));