import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';
import '../../../utils/screenAdapter.dart';
import '../../../utils/search_service.dart';
import '../controllers/user_search_controller.dart';

class UserSearchView extends GetView<UserSearchController> {
  const UserSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0, //去除阴影
          backgroundColor: Colors.white,
          title: Container(
            width: ScreenAdapter.width(840),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              autofocus: true, //进入页面弹出键盘
              style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.all(0), //可以使文本在文本框中居中
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ScreenAdapter.height(30)),
                    borderSide: BorderSide.none),
              ),
              onChanged: (value) => controller.keywords = value,
              //监听键盘的回车事件
              onSubmitted: (value) {
                //保存搜索记录
                SearchServices.setHistoryData(controller.keywords);
                //替换路由
                Get.offAndToNamed(Routes.PRODUCT_LIST, arguments: {"keywords": value});
              },
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  //保存搜索记录
                  SearchServices.setHistoryData(controller.keywords);
                  //替换路由跳转
                  Get.offAndToNamed(Routes.PRODUCT_LIST,arguments: {"keywords": controller.keywords});
                },
                child: Text("搜索", style: TextStyle(fontSize: ScreenAdapter.fontSize(36),color: Colors.black54))
            )
          ],
        ),
        body: SizedBox(
          child: ListView(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            children: [
              Obx(() => controller.historyList.isNotEmpty ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("搜索历史"),
                          IconButton(
                              onPressed: () {
                                Get.bottomSheet(Container(
                                  width: ScreenAdapter.width(1080),
                                  height: ScreenAdapter.height(580),
                                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Row(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          children: [
                                            Text("您确定要清空历史记录吗？",style: TextStyle(fontSize: 18))
                                          ]),
                                      SizedBox(
                                          height: ScreenAdapter.height(40)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(80)),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(209, 235, 235, 235)),
                                                      foregroundColor:MaterialStateProperty.all(Colors.red)),
                                                  onPressed: () {
                                                    controller.clearHistoryData();
                                                    Get.back();
                                                  },
                                                  child: const Text("确定")),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                                                  onPressed: () {
                                                    SearchServices.clearHistoryData();
                                                    Get.back();
                                                  },
                                                  child: const Text("取消")),
                                            ]),
                                      )
                                    ],
                                  ),
                                ));
                              },
                              icon: const Icon(Icons.delete_forever_outlined)),
                        ],
                      ),
                    )
                  : const Text("")),

              Obx(() => Wrap(
                    spacing: 6,
                    children: controller.historyList.map((value) => GestureDetector(
                      onLongPress: (){
                        Get.defaultDialog(
                          title: "提示信息",
                          middleText: "您确定要删除吗？",
                          confirm: ElevatedButton(onPressed: (){
                            controller.deleteHistoryData(value);
                            Get.back();
                          }, child: const Text("确定")),
                          cancel: ElevatedButton(onPressed: (){
                            Get.back();
                          }, child: const Text("取消"))
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(ScreenAdapter.height(16)),
                        margin: EdgeInsets.all(ScreenAdapter.height(16)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.pink.shade300),
                            borderRadius: BorderRadius.circular(ScreenAdapter.height(20))),
                        child: Text(value),
                      ),
                    )).toList()
                  )),
              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("猜你想搜"),
                    Icon(Icons.refresh),
                  ],
                ),
              ),
              Obx(() => Wrap(
                    spacing: 6,
                    children: controller.historyList
                        .map((value) => Container(
                              padding: EdgeInsets.all(ScreenAdapter.height(16)),
                              margin: EdgeInsets.all(ScreenAdapter.height(16)),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.pink.shade300),
                                  borderRadius: BorderRadius.circular(
                                      ScreenAdapter.height(20))),
                              child: Text(value),
                            ))
                        .toList(),
                  )),
              const SizedBox(height: 20),
              //热销商品
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: ScreenAdapter.height(138),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/hot_search.png"))),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(20)),
                      child: GridView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: ScreenAdapter.width(40),
                                  mainAxisSpacing: ScreenAdapter.height(20),
                                  childAspectRatio: 3 / 1),
                          itemBuilder: (context, idnex) {
                            return Row(children: [
                              Container(
                                alignment: Alignment.center,
                                width: ScreenAdapter.width(120),
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(10)),
                                child: Image.network(
                                    "https://www.itying.com/images/shouji.png",
                                    fit: BoxFit.fitHeight),
                              ),
                              Expanded(
                                  child: Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(10)),
                                alignment: Alignment.topLeft,
                                child: const Text("小米净化器 热水器  小米净化器"),
                              ))
                            ]);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
