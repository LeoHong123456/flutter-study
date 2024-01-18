import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{

  ///存储本地数据
  static setData(String key, dynamic value) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  ///获取本地持久数据
  static getData(String key) async{
    try{
      var prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString(key);
      if(data!= null){
        return json.decode(data!);
      }
      return null;
    } catch (e){
      return null;
    }
  }

  ///删除本地持久数据
  static removeData(String key) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  ///清空数据
  static clear(String key) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
 }