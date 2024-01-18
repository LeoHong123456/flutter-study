import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
  late VideoPlayerController _playerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    String url = "https://globalimg.sucai999.com/uploadfile/20211120/267440/132818929907174493.mp4";
    _playerController =  VideoPlayerController.networkUrl(Uri.parse(url));
    _chewieController = ChewieController(
      videoPlayerController: _playerController,
      autoPlay: true,
      looping: true,
      //宽高比
      aspectRatio: 3/2,
      //添加标题水印
/*      subtitle: Subtitles(
        [
          //从0秒开始到10秒添加标题Leo888
          Subtitle(index: 0, start: Duration.zero, end: const Duration(seconds: 5), text: const Text("Leo888")),
          Subtitle(index: 2, start: const Duration(seconds: 6), end: const Duration(seconds: 21), text: const Text("66666")),
        ]
      ),*/
      // optionsBuilder: (context, defaultOptions) async {
      //   await showDialog<void>(
      //     context: context,
      //     builder: (ctx) {
      //       return AlertDialog(
      //         content: ListView.builder(
      //           itemCount: defaultOptions.length,
      //           itemBuilder: (_, i) => ActionChip(
      //             label: Text(defaultOptions[i].title),
      //             onPressed: () =>
      //                 defaultOptions[i].onTap!(),
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // },

      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () => debugPrint('My option works!'),
            iconData: Icons.chat,
            title: '播放速度',
          ),
          OptionItem(
            onTap: () =>
                debugPrint('Another option that works!'),
            iconData: Icons.chat,
            title: '取消',
          ),
        ];
      },
    );
  }

  @override
  void dispose() {
    _playerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("视频播放"),),
      // body: videoPlayer(_playerController),
      body: videoPlayerExpand(_chewieController),
      floatingActionButton: FloatingActionButton(
        child: Icon(_playerController.value.isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: (){
          setState(() {
            _playerController.value.isPlaying? _playerController.pause() : _playerController.play();
          });
        },
      ),
    );
  }
}

///视频播放
Widget videoPlayer(VideoPlayerController playerController){
  return Center(
      child: playerController.value.isInitialized ?
      AspectRatio(
        aspectRatio: playerController.value.aspectRatio,
        child: VideoPlayer(playerController),
      ) :
      AspectRatio(
          aspectRatio: playerController.value.aspectRatio,
          child: Container(color: Colors.pink.shade300,)
      )
  );
}

///视频播放扩展板
Widget videoPlayerExpand(ChewieController chewieController){
  return Center(
      child: AspectRatio(
        //配置视频的宽高比
        aspectRatio: 3/2,
        child: Chewie(
          controller: chewieController,
        ),
      ),
  );
}