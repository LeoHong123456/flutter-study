import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/swiper.dart';

class AnimateSwiperScreen extends StatefulWidget {
  const AnimateSwiperScreen({super.key});

  @override
  State<AnimateSwiperScreen> createState() => _AnimateSwiperScreenState();
}

class _AnimateSwiperScreenState extends State<AnimateSwiperScreen> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list = const ["images/01.jpeg", "images/jia1.jpeg", "images/jia2.jpeg"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("定时轮播图")), body: Swiper(list: list));
  }
}
