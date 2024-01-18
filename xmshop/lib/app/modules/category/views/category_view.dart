import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import 'package:xmshop/app/utils/LeoFonts.dart';
import 'package:xmshop/app/utils/http_client.dart';
import '../../../utils/screenAdapter.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0, //去除阴影
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: ()=>Get.toNamed(Routes.USER_SEARCH),
          child: Container(
            width: ScreenAdapter.width(840),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246,1),
                borderRadius: BorderRadius.circular(30)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(10), horizontal: ScreenAdapter.width(34)),
                  child: const Icon(Icons.search, color: Colors.black54),
                ),
                Text("小米手机", style: TextStyle(fontSize: ScreenAdapter.fontSize(32), color: Colors.black54))
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(LeoIcons.message, color: Colors.black45))
        ],
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_leftCate(), _rightCateDetail()],
        ),
      );
  }

  ///左侧分类菜单
  Widget _leftCate(){
    return Container(
        width: ScreenAdapter.width(280),
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Obx(() => ListView.builder(
            itemCount: controller.leftBaseCates.length,
            itemBuilder: (context, index){
              return InkWell(
                  onTap:()=> controller.changeIndex(index, controller.leftBaseCates[index].sId),
                  child: SizedBox(
                      width: double.infinity,
                      height: ScreenAdapter.height(180),
                      child: Obx(() => Stack(
                        fit: StackFit.expand,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: ScreenAdapter.width(10),
                                height: ScreenAdapter.height(120),
                                color: controller.selectIndex.value == index ? Colors.red :  Colors.white,
                              )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("${controller.leftBaseCates[index].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(36),
                                  fontWeight: controller.selectIndex.value == index ? FontWeight.bold : FontWeight.normal
                              )),
                          ),
                        ],
                      ))
                  )
              );
            }
        ))
    );
  }

  ///右侧菜单详情
  Widget _rightCateDetail(){
    return Expanded(
      flex: 1,
      child: SizedBox(
          height: double.infinity,
          child: Obx(() => GridView.builder(
              itemCount: controller.rightCategorys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //辅轴显示个数
                  crossAxisSpacing: ScreenAdapter.width(40),//元素间隔
                  mainAxisSpacing: ScreenAdapter.height(20),
                  childAspectRatio: 240 / 340
              ),
              itemBuilder: (context, index){
                return InkWell(
                  onTap: ()=>Get.toNamed(Routes.PRODUCT_LIST, arguments: {"cid": controller.rightCategorys[index].sId}),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Image.network(HttpClient.replaceImageUrl(controller.rightCategorys[index].pic), fit: BoxFit.fitHeight),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                          child: Text("${controller.rightCategorys[index].title}",style: TextStyle(fontSize: ScreenAdapter.fontSize(34)))
                      )
                    ],
                  ),
                );
              }
          ))

      ),
    );
  }
}
