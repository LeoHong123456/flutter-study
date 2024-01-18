import 'package:flutter/Material.dart';
import 'package:gap/gap.dart';

class MyDialog extends Dialog{
  final String title;
  final String content;
  final Function()? onTap;
  const MyDialog({super.key,required this.title, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context){
    return Material(
      //表示设置背景透明
      type: MaterialType.transparency,
      //一定要用 Center组件包裹，不然会全屏
      child: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children:  [
                            const Icon(Icons.info, size: 25),
                            const Gap(8),
                            Text(title, style: const TextStyle(fontSize: 18),)
                          ],
                        )
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: onTap,
                            child: const Icon(Icons.close,size: 25,),
                          )
                      ),
                    ],
                  ),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Text(content),
              )
            ],
          ),
        ),
      ),
    );
  }
}
