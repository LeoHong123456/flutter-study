import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../domain/base_cate_model.dart';
import '../../../utils/http_client.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  //左侧分类
  final RxList<BaseCateItem> leftBaseCates = <BaseCateItem>[].obs;
  //右侧分类详情
  final RxList<BaseCateItem> rightCategorys = <BaseCateItem>[].obs;

  HttpClient httpClient = HttpClient();

  @override
  void onInit() {
    super.onInit();
    getLeftBaseCate();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index, pid){
    selectIndex.value = index;
    getRightCategory(pid);
    update();
  }

  ///左侧分类
  getLeftBaseCate() async{
    var response = await httpClient.get("api/pcate");
    if(response != null){
      BaseCateEntity popularProductsEntity = BaseCateEntity.fromJson(response.data);
      leftBaseCates.value = popularProductsEntity.result!; //不为空赋值
      getRightCategory(leftBaseCates[0].sId!);
      update();
    }
  }

  ///右侧分类详情
  getRightCategory(String pid) async{
    var response = await httpClient.get("api/pcate?pid=$pid");
    if(response != null){
      BaseCateEntity popularProductsEntity = BaseCateEntity.fromJson(response.data);
      rightCategorys.value = popularProductsEntity.result!; //不为空赋值
      update();
    }
  }

}
