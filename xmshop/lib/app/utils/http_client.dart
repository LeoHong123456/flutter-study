import 'package:dio/dio.dart';

class HttpClient {

  static const String domain = "https://xiaomi.itying.com/";

  static Dio dio = Dio();

  HttpClient(){
    dio.options.baseUrl = domain;
    dio.options.connectTimeout= const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 10000);
    dio.options.contentType = Headers.formUrlEncodedContentType;
  }

  ///发起Get网络请求
  Future get(String apiUrl) async{
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print("Error: ${e}");
      return null;
    }
  }

  ///图片链接评价
  static replaceImageUrl(url){
    String tempUrl = domain + url;
    return tempUrl.replaceAll("\\", "/");
  }

}