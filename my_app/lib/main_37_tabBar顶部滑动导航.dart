import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> list = [];

//生命周期函数，组件初始化的时候执行
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //leading 在标题前面显示的一个控件，在首页通常显示应用的logo; 在其它界面通常显示未返回按钮
      //title 标题，通常显示未当前界面的标题文字，可以放任意组件
      //actions 通常使用IconButton来表示，可以放按钮组
      //bottom 通常放tabBar,标题下面显示一个Tab导航栏
      //backgroundColor 导航背景颜色
      //iconTheme 图标样式
      //centerTitle 标题是否居中显示
      appBar: AppBar(
        //导航背景颜色
        backgroundColor: Colors.green.shade300,
        //左侧按钮图标
        leading: IconButton(
            icon: const Icon(Icons.menu), onPressed: () => print("左侧按钮")),
        centerTitle: true,
        title: const Text("头条滑动导航"),
        //右侧按钮图标
        actions: [
          IconButton(
              onPressed: () => print("搜索"), icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => print("更多"), icon: const Icon(Icons.more_horiz)),
        ],
        bottom: TabBar(
          //TabController对象
          controller: _tabController,
          //是否可以滚动
          isScrollable: true,
          //指示器颜色
          indicatorColor: Colors.pink.shade300,
          //指示器高度
          indicatorWeight: 5,
          //底部指示器的Padding
          indicatorPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          //指示器decoration列如边框等
          // indicator: BoxDecoration(
          //   border: Border.all(
          //       width: 1.0,
          //       color: Colors.pink.shade300,
          //       borderRadius: BorderRadius.circular(10),
          //       style: BorderStyle.solid),
          // ),
          //indicatorSize 指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽，TabBarIndicatorSize.tab跟每个tab等宽
          indicatorSize: TabBarIndicatorSize.tab,
          //选中的label颜色
          labelColor: Colors.pink.shade300,
          //选中的label样式
          labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.pink.shade300,
              fontWeight: FontWeight.w600),
          //每个label的padding值
          labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          //未选中的颜色
          unselectedLabelColor: Colors.white,
          //未选中的label样式
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          //显示的标签内容，一般使用Tab对象，也可以是其它的Widget
          tabs: const [
            Tab(child: Text("关注")),
            Tab(child: Text("热门")),
            Tab(child: Text("视频")),
            Tab(child: Text("关注")),
            Tab(child: Text("热门")),
            Tab(child: Text("视频")),
            Tab(child: Text("关注")),
            Tab(child: Text("热门")),
            Tab(child: Text("视频")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: const [
              Text("关注列表"),
            ],
          ),
          ListView(
            children: const [
              Text("热门列表"),
            ],
          ),
          ListView(
            children: const [
              Text("视频列表"),
            ],
          ),
          ListView(
            children: const [
              Text("关注列表"),
            ],
          ),
          ListView(
            children: const [
              Text("热门列表"),
            ],
          ),
          ListView(
            children: const [
              Text("视频列表"),
            ],
          ),
          ListView(
            children: const [
              Text("关注列表"),
            ],
          ),
          ListView(
            children: const [
              Text("热门列表"),
            ],
          ),
          ListView(
            children: const [
              Text("视频列表"),
            ],
          ),
        ],
      ),
    );
  }
}
