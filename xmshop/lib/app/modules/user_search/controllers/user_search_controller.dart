import 'package:get/get.dart';
import 'package:xmshop/app/utils/search_service.dart';

class UserSearchController extends GetxController {
  String keywords = "";
  RxList historyList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///获取历史记录
  getHistoryList() async{
    var historyData = await SearchServices.getHistoryData();
    if(historyData.isNotEmpty){
      historyList.addAll(historyData);
      update();
    }
  }

  ///清除历史记录
  clearHistoryData() async{
    await SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }

  ///删除单条记录
  deleteHistoryData(keywords) async{
    await SearchServices.deleteHistoryData(keywords);
    historyList.remove(keywords);
    update();
  }

}
