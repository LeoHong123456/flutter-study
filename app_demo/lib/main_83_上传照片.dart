import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color: Colors.pink.shade300)),
  home: const HomePage(),
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickerFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("上传视频")),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _pickerFile == null ? const Text("选择照片..."): Image.file(File(_pickerFile!.path)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _recordImage, child: const Text("拍摄照片")),
            ElevatedButton(onPressed: _chooseImage, child: const Text("相册选择")),
            // ElevatedButton(onPressed: _uploadFile, child: const Text("上传视频")),
          ],
        )
      ),
    );
  }

  ///拍照
  _recordImage() async {
    XFile? pickImage = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      _uploadFile(pickImage.path);
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }

  ///相册选择
  _chooseImage() async {
    XFile? pickImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      _uploadFile(pickImage.path);
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }


  ///上传文件
  _uploadFile(filePath)async{
    var formData =  FormData.fromMap({
      'name' : "zhangsan",
      'age' : 33,
      'file': await MultipartFile.fromFile(filePath, filename: 'upload.jpg')
    });
    var response = await Dio().post("https://jdmall.itying.com/imgupload", data: formData);
    print(response.data);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
    print("组件销毁完成>>>");
  }
}

