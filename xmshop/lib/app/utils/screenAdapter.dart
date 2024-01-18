import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter{

  ///设置容器宽度
   static width(num v){
     return v.w;
   }

   ///设置容器高度
   static height(num v){
     return v.h;
   }

   ///设置字体像素
   static fontSize(num v){
     return v.sp;
   }

   /// 获取屏幕宽度
   static getScreenWidth(){
     // ScreenUtil().screenWidth;
     return 1.sw;
   }

   ///获取屏幕高度
   static getScreenHeight(){
     // ScreenUtil().screenHeight;
     return 1.sh;
   }
}