import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter 按钮"),
        ),
        body: const HomePage(),
      ),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  //修改字体颜色
                  foregroundColor: MaterialStateProperty.all(Colors.red),
                  //修改背景颜色
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade300),
                ),
                onPressed: () {
                  print("凸起按钮事件>>>");
                },
                child: const Text("普通按钮"),
              ),
              TextButton(
                onPressed: () {
                  print("文本按钮事件>>>");
                },
                child: const Text("文本按钮"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("带边框的按钮事件>>>");
                },
                child: Text("带边框的按钮"),
              ),
              IconButton(
                onPressed: () {
                  print("ICON按钮");
                },
                icon: const Icon(Icons.thumb_up),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print("带Icon图标并且带文本的按钮");
                },
                icon: const Icon(Icons.send),
                label: const Text("发送"),
              ),
              TextButton.icon(
                onPressed: () {
                  print("文本按钮带图标");
                },
                icon: Icon(Icons.message),
                label: Text("消息"),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("增加"),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Container(
                height: 60,
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("自定义按钮");
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("查询"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade600),
                          ),
                          onPressed: () {
                            print("自适应按钮");
                          },
                          child: const Text("自适应按钮")),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
                onPressed: () {
                  print("圆角按钮");
                },
                child: const Text("圆角按钮"),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder(
                        side: BorderSide(color: Colors.green.shade600))),
                  ),
                  onPressed: () {
                    print("圆形按钮");
                  },
                  child: const Text("圆形按钮"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () {
                  print("带边框的按钮修改边框颜色");
                },
                child: const Text("带边框的按钮修改边框颜色"),
              )
            ],
          )
        ],
      ),
    );
  }
}
