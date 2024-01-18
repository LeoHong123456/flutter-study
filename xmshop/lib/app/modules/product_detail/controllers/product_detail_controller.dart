import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends GetxController {
  RxBool flag = false.obs;
  RxDouble opcity = .0.obs;
  final ScrollController scroll =  ScrollController();

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

  void scrollControllerListener(){
    scroll.addListener(() {
      if(scroll.position.pixels < 100) {
        opcity.value = scroll.position.pixels / 100;
        update();
      }
    });
  }

}
