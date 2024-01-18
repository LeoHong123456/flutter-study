import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/domain/plist_model.dart';
import 'package:xmshop/app/utils/http_client.dart';

class ProductListController extends GetxController {
  int page = 1;
  int pageSize = 8;
  bool flag = true;
  String sort = "";
  RxBool hasData = true.obs;
  RxInt icon = 1.obs;
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  String? keywords = Get.arguments['keywords'];
  String? cid = Get.arguments['cid'];
  String apiUrl = "";

  RxList<PlistItem> plist = <PlistItem>[].obs;
  ScrollController scrollController = ScrollController();
  HttpClient httpClient = HttpClient();

  /*二级导航*/
  List subHeaders = [
    {"id":1,"title":"综合","fileds":"all","sort":-1},
    {"id":2,"title":"销量","fileds":"salecount","sort":-1},
    {"id":3,"title":"价格","fileds":"price","sort":-1},
    {"id":4,"title":"筛选"},
  ];
  /*二级导航选中判断*/
  RxInt selectHeaderId = 1.obs;
  //解决排序箭头无法更新
  RxInt subHeaderSort = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getPlist();
    initScrollController(); //监听滚动条事件
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initScrollController(){
    scrollController.addListener(() {
      var pixels = scrollController.position.pixels; //滚动条下拉高度
      var maxPixels = scrollController.position.maxScrollExtent;//页面总高度
      //如果滚动条下拉到最后20个像素加载下一页数据
      if(pixels > (maxPixels - 20)){
        getPlist();
      }
    });
  }

  //获取分类商品列表
  getPlist()async{
    if(flag && hasData.value){
      flag = false;
      if(cid != null){
        apiUrl = "api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize&sort=$sort";
      }else{
        apiUrl = "api/plist?search=${Get.arguments["keywords"]}&page=$page&pageSize=$pageSize&sort=$sort";
      }
      var response = await httpClient.get(apiUrl);
      print(apiUrl);
      if(response != null){
        PlistEntity plistEntity = PlistEntity.fromJson(response.data);
        plist.addAll(plistEntity.result!); //不为空赋值
        page++;
        update();
        flag = true;
        //当返回数据少于每页数量，修改hasData为false
        (plistEntity.result!.length < pageSize) ? hasData.value = false : true;
      }
    }
  }

  //切换二级菜单
  void subHeaderChange(id){
    if(id == subHeaders.length){
      scaffoldGlobalKey.currentState!.openEndDrawer();
      selectHeaderId.value = id;
    }else{
      selectHeaderId.value = id;
      //改变排序
      sort = "${subHeaders[id - 1]['fileds']}_${subHeaders[id - 1]['sort']}";
      //双项排序，负负得正逻辑实现
      subHeaders[id - 1]['sort'] = subHeaders[id - 1]['sort'] * -1;
      //重置page
      page = 1; plist.value = []; hasData.value = true;
      //滚动条回到顶部
      scrollController.jumpTo(0);
      icon.value = subHeaders[id - 1]['sort'];
      //每点一次箭头响应式修改保持页面元素刷新
      subHeaderSort.value = subHeaders[id - 1]['sort'];
      //重新请求接口
      getPlist();
    }
  }
}
