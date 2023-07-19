import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key, required this.arguments});
  final Map arguments;

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.arguments,
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/"),
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset("images/01.jpeg", fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
