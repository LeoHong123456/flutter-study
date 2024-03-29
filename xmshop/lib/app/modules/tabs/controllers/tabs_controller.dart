import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  final RxInt currentIndex = 0.obs;
  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(index){
    currentIndex.value = index;
    update();
  }
}
