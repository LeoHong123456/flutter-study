import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("二维码-条形码扫码")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _doBarcodeScan, child: const Text("扫描二维码条形码"))
          ],
        ),
      ),
    );
  }

  _doBarcodeScan() async{
    var options = const ScanOptions(
      autoEnableFlash: true,
      strings: {
        'cancel': '取消',
        'flash_on': '打开闪光灯',
        'flash_off': '关闭闪光灯'
      }
    );
    var result = await BarcodeScanner.scan(options: options);
    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result.formatNote);
  }
}
