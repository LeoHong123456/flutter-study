import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gap/gap.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: const HomePage(),
  //配置国际化
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ],
  supportedLocales: const [
    Locale('zh','CH'),
    Locale('en','US')
  ],
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _date = DateTime.now();
  var _time = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    //获取日期
    var dateTime = DateTime.now();
    print("dateTime: $dateTime");
    print("dateTime:${dateTime.year}年${dateTime.month}月${dateTime.day}日 ${dateTime.hour}时${dateTime.minute}分${dateTime.second}秒");

    //获取时间戳
    int milliseconds = dateTime.millisecondsSinceEpoch;
    print("时间戳$milliseconds");

    //转换时间戳
    var dateTime2 = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    print("时间戳转换成时间：$dateTime2");

    //字符串转换成时间
    String dateStr = "2023-11-07 03:00:00";
    var parse = DateTime.parse(dateStr);
    print(parse);

    //时间加减
    var date = DateTime.now();
    var add = date.add(const Duration(days:5, hours:5));
    print("加后的时间:$add");

    var subtract = date.subtract(const Duration(days:1,hours:2));
    print("减掉后的时间：$subtract");

    //TimeOfDay获取当前时间
    var timeOfDay = TimeOfDay.now();
    print(timeOfDay.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("日期|时间|国际化")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Text("${_date.year}-${_date.month}-${_date.day}"),
                  const Icon(Icons.arrow_drop_down_sharp)
                ]
              ),
              onTap: () async {
                //弹出时间框组件
                var showDatePicker2 = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(1990,1,1),
                    lastDate: DateTime(2023,12,12)
                );
                setState(() {
                  _date = showDatePicker2!;
                });
              },
            ),
            const Gap(40),
            InkWell(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Text("${_time.hour}-${_time.minute}"),
                    const Icon(Icons.arrow_drop_down_sharp)
                  ]
              ),
              onTap: () async {
                //弹出时间框组件
                var timePicker = await showTimePicker(
                    context: context,
                    initialTime: _time,
                );
                setState(() {
                  _time = timePicker!;
                });
              },
            ),

        ]
      ),
    );
  }
}
