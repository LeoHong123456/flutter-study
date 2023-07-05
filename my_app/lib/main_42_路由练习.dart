import 'package:flutter/material.dart';
import './route/routes_demo.dart';
import './route_screens/screens/bottom_bar.dart';
void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
    onGenerateRoute: onGenerateRoute,
    initialRoute: "/",
    home: const BottonBar(),

  )
);
