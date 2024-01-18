import 'dart:async';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme:ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _list = [];
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    //获取设备信息
    _getDeviceInfo();
    //获取网络信息
    _getNetWorkInfo();
    //监听网络信息
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        print("手机网络");
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        print("wifi");
      } else if (connectivityResult == ConnectivityResult.ethernet) {
        // I am connected to a ethernet network.
        print("以太网");
      } else if (connectivityResult == ConnectivityResult.vpn) {
        // I am connected to a vpn network.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
        print("VPN");
      } else if (connectivityResult == ConnectivityResult.bluetooth) {
        // I am connected to a bluetooth.
        print("蓝牙");
      } else if (connectivityResult == ConnectivityResult.other) {
        // I am connected to a network which is not in the above mentioned networks.
        print("其它网络");
      } else if (connectivityResult == ConnectivityResult.none) {
        // I am not connected to any network.
        print("无网络连接");
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    //关闭监听
    subscription.cancel();
  }

  /// 获取设备信息
  _getDeviceInfo() async{
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final map = deviceInfo.toMap();
    var tempList = map.entries.map((e){
      return ListTile(
        title: Text("${e.key}:${e.value}"),
      );
    }).toList();
    setState(()=>_list = tempList);
  }

  ///获取网络信息
  _getNetWorkInfo() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("手机网络");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("wifi");
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      print("以太网");
    } else if (connectivityResult == ConnectivityResult.vpn) {
      print("VPN");
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      print("蓝牙");
    } else if (connectivityResult == ConnectivityResult.other) {
      print("其它网络");
    } else if (connectivityResult == ConnectivityResult.none) {
      print("无网络连接");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("设备信息获取")),
      body: ListView(
        children: _list,
      ),
    );
  }
}
