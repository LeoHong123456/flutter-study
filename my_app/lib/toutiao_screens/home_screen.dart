import 'package:flutter/material.dart';
import 'package:wechat/utils/app_styles.dart';
import '../utils/keep_alive_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
    //监听——tabController 的改变事件
    _tabController.addListener(() {
      //会获取两次，所以要做个判断索引一直再执行打印逻辑
      if (_tabController.animation!.value == _tabController.index) {
        //获取滑动TabBar的索引值
        print(_tabController.index);
      }
    });
  }

//生命周期函数，当组件销毁的时候执行
  @override
  void dispose() {
    super.dispose();
    //销毁_tabController
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      //PreferredSize 可以修改AppBar 高度
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: .3,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 30,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              labelStyle: const TextStyle(fontSize: 14),
              onTap: (index) {
                print("此方法只能监听点击时间，滑动事件不支持,滑动事件需要监听TabController,当前索引=$index");
              },
              tabs: const [
                Tab(text: "直播"),
                Tab(text: "推荐"),
                Tab(text: "热门"),
                Tab(text: "动画"),
                Tab(text: "影视"),
                Tab(text: "国创"),
                Tab(text: "科技"),
                Tab(text: "专栏"),
                Tab(text: "娱乐"),
                Tab(text: "汽车"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //引入缓存，可以实现组件缓存
          KeepAliveWrapper(
            keepAlive: true,
            child: ListView(
              children: const [
                Text("直播1", style: TextStyle(fontSize: 40)),
                Text("直播2", style: TextStyle(fontSize: 40)),
                Text("直播3", style: TextStyle(fontSize: 40)),
                Text("直播4", style: TextStyle(fontSize: 40)),
                Text("直播5", style: TextStyle(fontSize: 40)),
                Text("直播6", style: TextStyle(fontSize: 40)),
                Text("直播7", style: TextStyle(fontSize: 40)),
                Text("直播8", style: TextStyle(fontSize: 40)),
                Text("直播9", style: TextStyle(fontSize: 40)),
                Text("直播10", style: TextStyle(fontSize: 40)),
                Text("直播11", style: TextStyle(fontSize: 40)),
                Text("直播12", style: TextStyle(fontSize: 40)),
                Text("直播13", style: TextStyle(fontSize: 40)),
                Text("直播14", style: TextStyle(fontSize: 40)),
                Text("直播15", style: TextStyle(fontSize: 40)),
                Text("直播16", style: TextStyle(fontSize: 40)),
                Text("直播17", style: TextStyle(fontSize: 40)),
                Text("直播18", style: TextStyle(fontSize: 40)),
                Text("直播19", style: TextStyle(fontSize: 40)),
                Text("直播20", style: TextStyle(fontSize: 40)),
                Text("直播21", style: TextStyle(fontSize: 40)),
                Text("直播22", style: TextStyle(fontSize: 40)),
                Text("直播23", style: TextStyle(fontSize: 40)),
                Text("直播24", style: TextStyle(fontSize: 40)),
                Text("直播25", style: TextStyle(fontSize: 40)),
                Text("直播26", style: TextStyle(fontSize: 40)),
                Text("直播27", style: TextStyle(fontSize: 40)),
                Text("直播28", style: TextStyle(fontSize: 40)),
                Text("直播29", style: TextStyle(fontSize: 40)),
                Text("直播30", style: TextStyle(fontSize: 40)),
              ],
            ),
          ),
          ListView(
            children: const [Text("推荐")],
          ),
          ListView(
            children: const [Text("热门")],
          ),
          ListView(
            children: const [Text("动画")],
          ),
          ListView(
            children: const [Text("影视")],
          ),
          ListView(
            children: const [Text("国创")],
          ),
          ListView(
            children: const [Text("科技")],
          ),
          ListView(
            children: const [Text("专栏")],
          ),
          ListView(
            children: const [Text("娱乐")],
          ),
          ListView(
            children: const [Text("汽车")],
          ),
        ],
      ),
    );
  }
}
