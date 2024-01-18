import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true, color:Colors.pink.shade300)),
  home: const HomePage(),
));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickerFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("相册-拍照")),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _pickerFile == null ? const Text("选择照片..."): Image.file(File(_pickerFile!.path)),
            ElevatedButton(onPressed: _photograph, child: const Text("拍照")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _choosePhoto, child: const Text("相册选择"))
          ],
        )
      ),
    );
  }


  //拍照
  _photograph() async{
    XFile? pickImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 800,
        maxWidth: 800
    );
    if(pickImage!= null){
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }

  //选择相册
  _choosePhoto() async{
    XFile? pickImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800
    );
    if(pickImage!= null){
      setState(() {
        _pickerFile = pickImage;
      });
    }
  }
}
