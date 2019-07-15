
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';

import 'package:chewie/chewie.dart';



class VideoPlayerWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoPlayerWidgetState();
  }
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  VideoPlayerController _videoPlayerController;

  bool _isInitial = false;

  ChewieController _chewieController;


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();


  }

  _startPlayeVideo() async {


    _videoPlayerController = VideoPlayerController.asset('assets/guide_01.mp4');


//    await _videoPlayerController.initialize();
//
//    await  _videoPlayerController.setLooping(true);
//
//    await  _videoPlayerController.play();
//
//
//    setState(() {
//
//      _isInitial = true;
//
//      print(_videoPlayerController.value.size);
//
//    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: true,
      aspectRatio: 16/9,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.purple,
        playedColor: Colors.red
      )
    );


    setState(() {
      _isInitial = true;
      print(_videoPlayerController.value.size);

    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayer'),
      ),

      body: Column(
        children: <Widget>[

          RaisedButton(
            onPressed: () {
              _startPlayeVideo();
            },
            child: Text('播放'),
          ),

          Container(
            child: _isInitial ?  Chewie(controller: _chewieController,)
             : Text('初始化失败'),

            height: 300,
            alignment: Alignment.center,
            color: Colors.grey,
          ),

        ],
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    //_chewieController.dispose();
    _videoPlayerController.dispose();

    super.dispose();

  }
}
