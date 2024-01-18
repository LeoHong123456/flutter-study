import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';


void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map packageDetail = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("获取包信息")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _getPackageInfo, child: const Text("获取包信息")),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _download, child: const Text("下载APP以及更新APP"))
          ],
        ),
      ),
    );
  }

  ///检测权限
  _checkPermission() async{
    if(Theme.of(context).platform == TargetPlatform.android){
      final status = await Permission.storage.status;
      //是否已授权
      if(status != PermissionStatus.granted){
        //请求授权
        final result = await Permission.storage.request();
        if(result == PermissionStatus.granted){
          return true;
        }
      }else{
        return true;
      }
    }
    return false;
  }

  _download() async{
    var permission = await _checkPermission();
    if(permission){
      Directory? downloadsDir = await getDownloadsDirectory();
      //保存到本地存储目录
      var _localPath = downloadsDir?.path;
      String _appName = "demo.apk";
      String _savePath = "$_localPath/$_appName";
      String url = "http://jd.itying.com/jdshop.apk";

      Dio dio = Dio();
      await dio.download(url, _savePath, onReceiveProgress: (received, total){
        if(total != -1){
         //当前下载百分比进度
          print("${(received / total * 100).toStringAsFixed(0)}%");
        }
      });
      print("保存文件到: $_localPath");
      await OpenFile.open(_savePath, type: "application/vnd.android.package-archive");
    }else{
      print("无权限");
    }
  }

  _getPackageInfo() async{
    WidgetsFlutterBinding.ensureInitialized();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    packageDetail["version"] = version;
    packageDetail["buildNumber"] = buildNumber;
    packageDetail["packageName"] = packageName;
    packageDetail["appName"] = appName;

    Directory tempDir = await getTemporaryDirectory();
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    Directory? downloadsDir = await getDownloadsDirectory();

    await showDialog(context: context, builder: (context){
      return AlertDialog(
          title: const Text("APP包信息"),
          content: ListView(
            children: [
              Text("APP名称：${packageDetail['appName']}"),
              Text("包名：${packageDetail['packageName']}"),
              Text("版本号：${packageDetail['version']}"),
              Text("编译号：${packageDetail['buildNumber']}"),
              const Divider(),
              Text("临时目录：${tempDir.path}"),
              Text("APP文档目录：${appDocumentsDir.path}"),
              Text("APP下载目录：${downloadsDir?.path}"),
              const Divider(),
            ],
          ),
          actions: [
            TextButton(onPressed: ()=>Navigator.of(context).pop("删除完成"), child: const Text("确定")),
            TextButton(onPressed: ()=>Navigator.of(context).pop("取消成功"), child: const Text("取消"))
          ]);
    });
  }
}
