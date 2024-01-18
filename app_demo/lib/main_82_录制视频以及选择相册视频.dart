import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
    home: const HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickerFile;

  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("录制视频-选择相册视频")),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _pickerFile == null
                ? const Text("请选择视频")
                : AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: chewieController),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _recordVideo, child: const Text("录制视频")),
            ElevatedButton(
                onPressed: _chooseVideo, child: const Text("相册选择视频")),
          ],
        ),
      ),
    );
  }

  ///录制视频
  _recordVideo() async {
    XFile? pickImage = await _imagePicker.pickVideo(source: ImageSource.camera);
    if (pickImage != null) {
      await _initVideo(File(pickImage.path));
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }

  ///相册选择视频
  _chooseVideo() async {
    XFile? pickImage =
        await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickImage != null) {
      await _initVideo(File(pickImage.path));
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }

  _initVideo(filePath) async {
    videoPlayerController = VideoPlayerController.file(filePath);
    videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        //配置宽高比，需要先初始化之后才能获取宽高比
        aspectRatio: videoPlayerController.value.aspectRatio,
        autoPlay: true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }
}
