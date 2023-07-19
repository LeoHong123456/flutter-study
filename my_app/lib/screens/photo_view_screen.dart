import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatefulWidget {
  const PhotoViewScreen({super.key, required this.arguments});
  final Map arguments;

  @override
  State<PhotoViewScreen> createState() => _photoViewScreenState();
}

// ignore: camel_case_types
class _photoViewScreenState extends State<PhotoViewScreen> {
  List<String> list = [
    "images/01.jpeg",
    "images/jia1.jpeg",
    "images/jia2.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: widget.arguments,
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/"),
                child: PhotoViewGallery.builder(
                    //初始化显示第几张图片
                    pageController: PageController(initialPage: 1),
                    itemCount: 3,
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (context, index) {
                      return PhotoViewGalleryPageOptions(
                          imageProvider: AssetImage(list[index]));
                    }),
              ),
            ),
          ),
        ));
  }
}
