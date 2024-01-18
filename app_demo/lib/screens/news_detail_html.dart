import 'dart:convert';
import 'package:flutter/Material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsDetailHtml extends StatefulWidget {
  final Map arguments;
  const NewsDetailHtml({super.key,required this.arguments});

  @override
  State<NewsDetailHtml> createState() => _NewsDetailHtmlState();
}

class _NewsDetailHtmlState extends State<NewsDetailHtml> {
  List _list =[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  final dio = Dio();
  _getData() async{
    String url = "https://www.phonegap100.com/appapi.php";
    var params = {"a": "getPortalArticle", "aid": widget.arguments['aid']};
    var response  = await dio.get(url, queryParameters: params);
    setState(() {
      _list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title", textAlign: TextAlign.center, style: TextStyle(fontSize: 26)),),
      body: Center(
        child: _list.isNotEmpty ? ListView(
          children: [
            Text("${_list[0]["title"]}",textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Html(
                data: _list[0]['content'],
                style: {"body":Style(backgroundColor: Colors.white),"p": Style(fontSize: FontSize.xxLarge)},
                onLinkTap: (url, _, __) {
                  debugPrint("Opening $url...");
                }
              )
            )
          ],
        ): const CircularProgressIndicator(),
      )
    );
  }
}
