import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true, color: Colors.pink.shade300),
      ),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sex = 1;
  bool flag = true;

  String username = "";
  String password = "";
  String varcode = "";
  late TextEditingController _varCodeController;

  @override
  void initState() {
    super.initState();
    //表单初始化值
    _varCodeController = TextEditingController.fromValue(TextEditingValue(
      text: '5625',
      //flutter 3.X 无需配置selection 属性
      selection:
          TextSelection.fromPosition(TextPosition(offset: varcode.length)),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _varCodeController.dispose();
  }

  final List _hobby = [
    {"checked": true, "title": "听音乐"},
    {"checked": false, "title": "看书"},
    {"checked": true, "title": "编程"},
    {"checked": true, "title": "看电影"},
  ];

  _onChanged(value) {
    setState(() {
      // as 表示强制转换
      sex = value as int;
    });
  }

  List<Widget> _initHobby() {
    List<Widget> tempList = [];
    for (var hobby in _hobby) {
      tempList.add(Row(
        children: [
          Text("${hobby["title"]}"),
          Checkbox(
            value: hobby["checked"],
            onChanged: (value) {
              setState(() {
                hobby["checked"] = value;
              });
            },
          ),
        ],
      ));
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户资料'),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "用户名",
                    hintText: "请输入用户名",
                  ),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                const Gap(8),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "请输入密码",
                  ),
                  onChanged: (value) {
                    password = value;
                    // setState(() {
                    //   password = value;
                    // });
                  },
                ),
                const Gap(8),
                TextField(
                  controller: _varCodeController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.verified),
                    labelText: "验证码",
                    hintText: "请输入验证码",
                  ),
                  onChanged: (value) {
                    varcode = value;
                    // setState(() {
                    //   password = value;
                    // });
                  },
                ),
                const Gap(20),
                const Text("性别"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("男"),
                    Radio(
                      value: 1,
                      groupValue: sex,
                      onChanged: _onChanged,
                    ),
                    const Gap(20),
                    const Text("女"),
                    Radio(
                      value: 2,
                      groupValue: sex,
                      onChanged: _onChanged,
                    ),
                  ],
                ),
                const Text("是否已经进行核酸检测"),
                RadioListTile(
                  title: const Text("已完成核酸检测"),
                  subtitle: const Text("核酸检测"),
                  value: true,
                  groupValue: flag,
                  onChanged: (value) {
                    setState(() {
                      flag = value as bool;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("未完成核酸检测"),
                  subtitle: const Text("核酸检测"),
                  value: _hobby,
                  groupValue: _hobby,
                  onChanged: (value) {
                    setState(() {
                      flag = value as bool;
                    });
                  },
                ),
                const Gap(20),
                Text("爱好", style: Theme.of(context).textTheme.headline6),
                Row(
                  children: _initHobby(),
                ),
                const Gap(20),
                Switch(
                  value: flag,
                  onChanged: (value) {
                    setState(
                      () {
                        flag = value;
                      },
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () =>
                      print("表单信息为-->性别：$sex, 是否核酸检测:$flag, 兴趣爱好:$_hobby"),
                  child: const Text("获取表单信息"),
                ),
                Text("表单信息为-->性别：$sex, 是否核酸检测:$flag, 兴趣爱好:$_hobby"),
              ],
            )),
      ),
    );
  }
}
