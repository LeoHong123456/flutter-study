import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/utils/http_client.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../../utils/keep_alive_wrapper.dart';
import '../../../utils/screenAdapter.dart';
import '../../../utils/LeoFonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //缓存首页，当会员滑动到某一个位置缓存页面当前位置(一般缓存用在pageView, tabbar中使用)
    return KeepAliveWrapper(
      child: Scaffold(
      body: Stack(
        children: [_homePage(), _appBar()],
      ),
    ));
  }

  ///首页
  Widget _homePage(){
    return Positioned(
        top: ScreenAdapter.height(-160),
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [
            _swiper(),
            _banner(),
            _category(),
            _advertise(),
            _bestSellers(),
            _bestGoods(),
          ],
        )
    );
  }
  ///轮播图
  Widget _swiper(){
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
          autoplay: true,
          loop: true,
          // duration: 2000,
          itemCount: controller.swipers.length,
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          itemBuilder: (context, index){
            return Image.network(HttpClient.replaceImageUrl(controller.swipers[index].pic), fit: BoxFit.cover);
          }
      )),
    );
  }
  ///顶部导航
  Widget _appBar(){
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Obx(() => AppBar(
          leading: controller.flag.value ? const Text("") : const Icon(LeoIcons.xiaomi, color: Colors.white),
          leadingWidth: controller.flag.value ? ScreenAdapter.width(40) : ScreenAdapter.width(140),
          backgroundColor: controller.flag.value ? Colors.white : Colors.transparent,
          elevation: 0, //去除阴影
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.qr_code, color: controller.flag.value ? Colors.black54 : Colors.white)),
            IconButton(onPressed: (){}, icon: Icon(Icons.message, color: controller.flag.value ? Colors.black54 : Colors.white)),
          ],
          title: InkWell(
            onTap: ()=>Get.toNamed(Routes.USER_SEARCH),
            child: AnimatedContainer(
              width: controller.flag.value ? ScreenAdapter.width(800) : ScreenAdapter.width(620),
              height: ScreenAdapter.height(96),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 246, 246,1),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(10), horizontal: ScreenAdapter.width(34)),
                      child: Icon(Icons.search, color: controller.flag.value ? Colors.black54 : Colors.black54),
                    ),
                  ),
                  //此处起到自动伸缩效果Spacer()也可以达到同样的效果
                  Expanded(child: Text("小米手机", style: TextStyle(fontSize: ScreenAdapter.fontSize(32), color: Colors.black54))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(10), horizontal: ScreenAdapter.width(34)),
                      child: Icon(LeoIcons.qrcode, color: controller.flag.value ? Colors.black54 : Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ),
        ))
    );
  }
  ///banner
  Widget _banner(){
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset("assets/images/xiaomiBanner.png",fit: BoxFit.cover),
    );
  }
  ///分类
  Widget _category(){
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(470),
      child: Obx(() => Swiper(
          itemCount: controller.baseCates.length ~/ 10, //表示除以10取整数
          //默认指示器
          // pagination: const SwiperPagination(builder: SwiperPagination.rect),
          pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  //指示器位置调整
                  constraints: BoxConstraints.expand(height: ScreenAdapter.height(15)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.black54,
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              })),
          itemBuilder: (context, index){
            return GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //每一行显示的个数
                crossAxisCount: 5,
                //每个元素的间距
                crossAxisSpacing: ScreenAdapter.width(20) ,
                mainAxisSpacing: ScreenAdapter.height(20),
              ),
              itemBuilder: (context, i){
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.height(140),
                      height: ScreenAdapter.height(140),
                      //foxFit.fitHeight 纵向铺满
                      child: Image.network(HttpClient.replaceImageUrl(controller.baseCates[index*10+i].pic), fit: BoxFit.fitHeight),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                      child: Text("${controller.baseCates[index*10+i].title}", style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                    )
                  ],
                );
              },
            );
          }
      ))
    );
  }
  ///广告
  Widget _advertise(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(20), horizontal: ScreenAdapter.width(20)),
      child: Container(
        height: ScreenAdapter.height(420),
        width: ScreenAdapter.width(1080),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
            //实现图片圆角不能直接使用image组件，需要使用容器BoxDecoration 进行修饰
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/xiaomiBanner2.png")
            )
        ),
      )
    );
  }
  ///热销臻选
  Widget _bestSellers(){
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(20), horizontal: ScreenAdapter.height(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("热销臻选", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fontSize(46))),
                InkWell(
                  child: Text("更多手机>", style: TextStyle(fontSize: ScreenAdapter.fontSize(38))),
                  onTap: (){
                    print("更多手机>>>");
                  },
                )
              ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(40), horizontal: ScreenAdapter.width(30)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Obx(() => Swiper(
                        autoplay: true,
                        loop: true,
                        itemCount: controller.bestSelections.length,
                        pagination: const SwiperPagination(builder: SwiperPagination.rect),
                        itemBuilder: (context, index){
                          return Image.network(HttpClient.replaceImageUrl(controller.bestSelections[index].pic), fit: BoxFit.fill);
                        }
                    )),
                  )
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Obx(() => Column(
                      //遍历对象的时候加asMap().entries.map 就可以拿到Key(序列号), value
                      children: controller.popularProducts.asMap().entries.map((entrie){
                        var value = entrie.value;
                        var key = entrie.key;
                        return Expanded(
                            flex: 1,
                            child: Container(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              margin:EdgeInsets.fromLTRB(0, 0, 0, key == 2 ? 0: ScreenAdapter.height(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${value.title}", style: TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fontSize(38))),
                                          SizedBox(height: ScreenAdapter.height(20)),
                                          Text("${value.subTitle}", style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fontSize(28))),
                                          SizedBox(height: ScreenAdapter.height(20)),
                                          Text("众筹价 \$${value.price}", style: TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                                        ]
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(ScreenAdapter.height(8)),
                                      child: Image.network(HttpClient.replaceImageUrl(value.pic), fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            )
                        );
                      }).toList(),
                    ))
                  )
              )
            ],
          ),
        )
      ],
    );
  }
  ///热门商品
  Widget _bestGoods(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(20), horizontal: ScreenAdapter.height(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("省心优惠", style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fontSize(46))),
              InkWell(
                child: Text("全部优惠>", style: TextStyle(fontSize: ScreenAdapter.fontSize(38))),
                onTap: (){
                  print("更多手机>>>");
                },
              )
            ],
          ),
        ),
        Container(
          color: const Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: Obx(() => MasonryGridView.count(
            crossAxisCount: 2, //两列
            itemCount: controller.popularGoods.length,
            shrinkWrap: true, //收缩，让元素宽度自适应
            physics: const NeverScrollableScrollPhysics(), //禁止左右滑动
            mainAxisSpacing: ScreenAdapter.width(26),
            crossAxisSpacing: ScreenAdapter.width(26),
            itemBuilder: (context, index) {
              //生成随机高度算法(Random().nextDouble() 默认0.0 - 1.0范围)
              // var height = 50+150*Random().nextDouble();
              return GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {"id": controller.popularGoods[index].sId});
                },
                child: Container(
                  // height: height,
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.pinkccent, width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Image.network(HttpClient.replaceImageUrl(controller.popularGoods[index].sPic)),
                      ),
                      //MasonryGridView使用了该组件Text 无法修改位置，需要添加容器来进行修改
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text("${controller.popularGoods[index].title}", textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(38), fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text("${controller.popularGoods[index].subTitle}", textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text("￥${controller.popularGoods[index].price}", textAlign: TextAlign.start, style: TextStyle(fontSize: ScreenAdapter.fontSize(32), fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        )
      ],
    );
  }
}
