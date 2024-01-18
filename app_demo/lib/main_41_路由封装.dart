import 'package:flutter/material.dart';
import './route/routes.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //全局AppBar居中显示
          appBarTheme: const AppBarTheme(centerTitle: true)
      ),
      initialRoute: "/",
      //配置onGenerateRoute 路由
      onGenerateRoute: onGenerateRoute,
    ));
