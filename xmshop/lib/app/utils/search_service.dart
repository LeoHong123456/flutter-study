 import 'storage.dart';

class SearchServices{

  ///保存历史搜索记录
  static setHistoryData(keywords) async{
      List ? searchListData = await Storage.getData("searchList");
      if(searchListData != null){
        var hasData = searchListData.any((v)=> v == keywords);
        if(!hasData){
          searchListData.add(keywords);
          await Storage.setData("searchList", searchListData);
        }
      }else{
        List tempList = [];
        tempList.add(keywords);
        Storage.setData("searchList", tempList);
      }
  }

  ///获取历史数据
  static Future<List> getHistoryData() async{
    List ? searchListData = await Storage.getData("searchList");
    if(searchListData != null){
      return searchListData;
    }else{
      return [];
    }
  }

  ///删除搜索记录
 static deleteHistoryData(keywords) async{
    List ? searchListData = await Storage.getData("searchList");
    if(searchListData != null){
      searchListData.remove(keywords);
      await Storage.setData("searchList", searchListData);
    }
 }

 ///清空历史记录
  static clearHistoryData() async{
    await Storage.clear("searchList");
  }
}
