import 'package:avances/pages/AdvancesScreen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vid5.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            FloatingActionButton(
                heroTag: "btn2",
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AdvanceScreen(advances: advances))))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
