import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/domain/base_cate_model.dart';
import 'package:xmshop/app/domain/popular_products_model.dart';
import '../../../domain/best_selection_model.dart';
import '../../../domain/focus_model.dart';
import '../../../utils/http_client.dart';

class HomeController extends GetxController {
  final RxBool flag = false.obs;
  //轮播
  final RxList<FocusItem> swipers = <FocusItem>[].obs;
  //分类
  final RxList<BaseCateItem> baseCates = <BaseCateItem>[].obs;
  //臻选轮播
  final RxList<BaseSelectionItem> bestSelections = <BaseSelectionItem>[].obs;
  //热门臻选产品
  final RxList<PopularProductsItem> popularProducts =<PopularProductsItem>[].obs;
  //热门商品
  final RxList<PopularProductsItem> popularGoods =<PopularProductsItem>[].obs;
  //滚动条控制器
  final ScrollController scrollController = ScrollController();

  HttpClient httpClient = HttpClient();

  @override
  void onInit() {
    super.onInit();
    //监听下拉高度
    scrollController.addListener(() {
      //当下拉超过10个像素
      if(scrollController.position.pixels > 10){
        //避免多次修改
        if(flag.value == false){
          flag.value = true;
          update();
        }
      }
      if(scrollController.position.pixels < 10){
        if(flag.value == true){
          flag.value = false;
          update();
        }
      }
    });
    getFocus();
    getBaseCate();
    getBestSelection();
    getPopularProducts();
    getPopularGoods();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///轮播图片
  getFocus() async {
    var response = await httpClient.get("api/focus");
    if(response != null){
      FocusEntity focusEntity = FocusEntity.fromJson(response.data);
      swipers.value = focusEntity.result!; //不为空赋值
      update();
    }
  }

  ///首页分类
  getBaseCate() async{
    var response = await httpClient.get("api/bestCate");
    if(response != null){
      BaseCateEntity baseCateEntity = BaseCateEntity.fromJson(response.data);
      baseCates.value = baseCateEntity.result!; //不为空赋值
      update();
    }
  }

  ///臻选轮播图片
  getBestSelection() async{
    var response = await httpClient.get("api/focus?position=2");
    if(response != null){
      BestSelectionEntity baseSelectionEntity = BestSelectionEntity.fromJson(response.data);
      bestSelections.value = baseSelectionEntity.result!; //不为空赋值
      update();
    }
  }

  ///热门推荐
  getPopularProducts() async{
    var response = await httpClient.get("api/plist?is_best=1&pageSize=3");
    if(response != null){
      PopularProductsEntity popularProductsEntity = PopularProductsEntity.fromJson(response.data);
      popularProducts.value = popularProductsEntity.result!; //不为空赋值
      update();
    }
  }

  ///热门商品
  getPopularGoods() async{
    var response = await httpClient.get("api/plist??is_best=1");
    if(response != null){
      PopularProductsEntity popularProductsEntity = PopularProductsEntity.fromJson(response.data);
      popularGoods.value = popularProductsEntity.result!; //不为空赋值
      update();
    }
  }
}
