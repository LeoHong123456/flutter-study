import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/utils/screenAdapter.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar AppBar 内容扩展到内容区，实现透明导航
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(96)), //配置高度96
        child: Obx(() => AppBar(
            centerTitle: true,
            elevation: 0, //实现透明导航
            backgroundColor: Colors.white.withOpacity(controller.opcity.value), //实现透明导航
            leading: Container(
              alignment: Alignment.center,
              child: SizedBox(
                  width: ScreenAdapter.width(88),
                  height: ScreenAdapter.width(88),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero), //去掉默认的padding值
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.all(Colors.black12),//背景颜色
                          foregroundColor: MaterialStateProperty.all(Colors.white), //字体颜色
                          shape: MaterialStateProperty.all(const CircleBorder())
                      ),
                      onPressed: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_new)
                  )
              ),
            ),
            actions: [
              Container(
                width: ScreenAdapter.width(88),
                height: ScreenAdapter.width(88),
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero), //去掉默认的padding值
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(Colors.black12),//背景颜色
                        foregroundColor: MaterialStateProperty.all(Colors.white), //字体颜色
                        shape: MaterialStateProperty.all(const CircleBorder())
                    ),
                    onPressed: (){},
                    child: const Icon(Icons.file_upload_outlined)
                ) ,
              ),

              Container(
                width: ScreenAdapter.width(88),
                height: ScreenAdapter.width(88),
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(Colors.black12),
                      foregroundColor: MaterialStateProperty.all(Colors.white), //字体颜色
                      shape: MaterialStateProperty.all(const CircleBorder())
                  ),
                  child: const Icon(Icons.more_horiz_rounded),
                  onPressed: (){},
                ),
              ),
            ],
            title: Container(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.height(96),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("商品", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                          Container(
                              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                              width: ScreenAdapter.width(100),
                              height: ScreenAdapter.height(2),
                              color: Colors.red
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("商品详情", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                          Container(
                              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                              width: ScreenAdapter.width(100),
                              height: ScreenAdapter.height(2),
                              color: Colors.red
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("推荐", style: TextStyle(fontSize: ScreenAdapter.fontSize(36))),
                          Container(
                              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                              width: ScreenAdapter.width(100),
                              height: ScreenAdapter.height(2),
                              color: Colors.red
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )
        )),
      ),
      body: ListView(
        controller: controller.scroll,
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.orange,
          ),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
          ListTile(title: Text("内容列表"),),
        ],
      ),
    );
  }
}
