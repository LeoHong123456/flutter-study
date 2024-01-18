import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/utils/http_client.dart';
import '../../../utils/screenAdapter.dart';
import '../controllers/product_list_controller.dart';
import '../../../routes/app_pages.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      key: controller.scaffoldGlobalKey,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0, //去除阴影
          backgroundColor: Colors.white,
          actions: const [Text("")], //可以去除默认的抽屉
          title: Container(
            width: ScreenAdapter.width(910),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(30)
            ),
            child: InkWell(
              onTap: ()=>Get.offAndToNamed(Routes.SEARCH),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenAdapter.height(10),
                        horizontal: ScreenAdapter.width(34)),
                    child: const Icon(Icons.search, color: Colors.black54),
                  ),
                  Text(controller.keywords!=null? "${controller.keywords}" : "",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32),color: Colors.black54))
                ],
              ),
            ),
          )
      ),
      endDrawer: const Drawer(
        child: DrawerHeader(child: Text("右侧筛选")),
      ),
      body: Obx(() => controller.plist.isNotEmpty ?
        Stack(children: [_productList(), _subHeader(),]) : _progressIndicator())
    );
  }


  Widget _productList(){
    return ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.plist.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left:ScreenAdapter.width(26),top: ScreenAdapter.height(140), right: ScreenAdapter.width(26), bottom: ScreenAdapter.width(26)),
        itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(26)),
                ),
                margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(60)),
                      width: ScreenAdapter.width(400),
                      height: ScreenAdapter.height(460),
                      child: Image.network("${HttpClient.replaceImageUrl(controller.plist[index].pic)}", fit: BoxFit.fitHeight),//BoxFit.fitHeight高度自适应宽度居中
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                              child: Text("${controller.plist[index].title}", style: TextStyle(fontSize: ScreenAdapter.fontSize(42),fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                              child: Text("${controller.plist[index].subTitle}", style: TextStyle(fontSize: ScreenAdapter.fontSize(34),overflow: TextOverflow.ellipsis,)),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                        children: [
                                          Text("CPU",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                          SizedBox(height: ScreenAdapter.height(10)),
                                          Text("Helio G25",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                        ],
                                      )
                                  ),
                                  Expanded(
                                      child: Column(
                                        children: [
                                          Text("高清拍摄",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                          SizedBox(height: ScreenAdapter.height(10)),
                                          Text("1300万像素",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                        ],
                                      )
                                  ),
                                  Expanded(
                                      child: Column(
                                        children: [
                                          Text("超大屏",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                          SizedBox(height: ScreenAdapter.height(10)),
                                          Text("6.53英寸",style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                              child: Text("￥${controller.plist[index].price}", style: TextStyle(fontSize: ScreenAdapter.fontSize(38),fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              // 在最后一个元素中添加我是有底线的提示
              (index == controller.plist.length - 1) ? _progressIndicator() : Text("",style: TextStyle(fontSize: ScreenAdapter.fontSize(0))),
            ],
          );
        }
    );
  }

  Widget _subHeader(){
    return Positioned(
      left: 0,top: 0,right: 0,
        child: Obx(() => Container(
          height: ScreenAdapter.height(120),
          width: ScreenAdapter.width(1080),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                  width: ScreenAdapter.height(2),
                  color: const Color.fromRGBO(233, 233, 233, 0.9)
              )
            )
          ),
          child: Row(
            children: controller.subHeaders.map((value){
              return Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                          child: Text("${value['title']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: controller.selectHeaderId == value['id'] ? Colors.red : Colors.black, fontSize: ScreenAdapter.fontSize(32))),
                        ),
                        onTap: (){
                          //最后一个标题选中抽屉弹出,选中的title高亮
                          controller.subHeaderChange(value['id']);
                        },
                      ),
                      _showIcon(value['id'])
                    ],
                  )
              );
            }).toList(),
          )
        )),
    );
  }
  
  Widget _progressIndicator(){
    if(controller.hasData.value){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return const Center(
        child: Text("-- 我是有底线的 --"),
      );
    }
  }

  //二级导航箭头组件
  Widget _showIcon(id){
    //controller.subHeaderSort 为了修改响应式状态
    if(id ==1){
      return const Text("",style: TextStyle(fontSize: 0));
    }
    if((id == 2 || id == 3) || (controller.subHeaderSort.value == 1 || controller.subHeaderSort.value == -1)){
      if(controller.subHeaders[id - 1]['sort'] == 1){
        return const Icon(Icons.arrow_drop_up, color: Colors.black54);
      }else{
        return const Icon(Icons.arrow_drop_down, color: Colors.black54);
      }
    }else{
      return const Text("",style: TextStyle(fontSize: 0));
    }
  }
}
