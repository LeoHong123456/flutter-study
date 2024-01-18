import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import './data/person.dart';
import './data/admin.dart';


void main()=>runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: HomePage(),
));


class HomePage extends StatelessWidget {
  HomePage({super.key});
  ///定义一个响应式变量方式一
  final RxInt _count = 0.obs;
  final RxString _username = "张三".obs;
  final RxList _list = ["张三","李四","王五"].obs;

  ///定义响应式变量方式二
  final Rx<String> _sex = Rx<String>("男");

  ///对象定义响应式方式一
  var person = Person();

  ///对象定义响应式方式二
  var admin = Admin("上官瑞谦", 22).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //局部取值局部刷新,渲染数据
            Obx(()=>Text("${_count.value}", style: Theme.of(context).textTheme.headlineLarge)),
            const SizedBox(height: 20),
            Obx(() => Text(_username.value, style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: 20),
            Obx(() => Text(_sex.value, style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: 20),
            Obx(() => Text("${person.username}", style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: 20),
            Obx(() => Text(admin.value.username, style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: 20),
            Obx((){
              return Column(
                children: _list.map((el) => ListTile(title: Text(el))).toList(),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //获取响应式变量的值
          _count.value++;
          _username.value= "李四";
          _list.add("赵六");
          person.username.value = "[${person.username.value}]";

          //整个对象obs修改值需要重新赋值
          admin.value.username =  "项羽";
          admin.value = admin.value;
        },
      ),
    );
  }
}

