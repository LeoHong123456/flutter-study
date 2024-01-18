import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const HomePage()
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("打开外部应用组件使用")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              child: const Text("打开外部浏览器"),
              onPressed: () async{
                final Uri url = Uri.parse("https://www.itying.com");
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }else{
                  throw 'Could not launch $url';
                }
              },
            ),
            ElevatedButton(
                onPressed: ()async{
                  final Uri url = Uri.parse("tel:+1-555-010-999");
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("拨打电话")
            ),
            ElevatedButton(
                onPressed: ()async{
                  final Uri url = Uri.parse("sms:10086");
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("发送短信")
            ),
            ElevatedButton(
                onPressed: ()async{
                  final Uri url = Uri.parse("alipays://");
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("打开支付宝")
            ),
            ElevatedButton(
                onPressed: ()async{
                  final Uri url = Uri.parse("tmall://");
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("打开天猫商城")
            ),
            ElevatedButton(
                onPressed: ()async{
                  final Uri url = Uri.parse("wechat://");
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("打开微信")
            ),
            ElevatedButton(
                onPressed: ()async{ 
                  String address = "北京大学";
                  String latitude = '39.992806';   //经度
                  String longitude = '116.310905'; //纬度
                  Uri url = Uri.parse('${Platform.isAndroid? 'android' : 'ios'}amap://navi?sourceApplication=appname&lat=${latitude}&lon=${longitude}&dev=1&style=2');
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  }else{
                    throw '无法打开高德地图';
                  }
                },
                child: const Text("打开高德地图")
            ),
          ],
        ),
      )
    );
  }
}
