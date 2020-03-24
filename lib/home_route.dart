import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  VideoPlayerController _controller;
  VoidCallback _listener;
  IconData _icon;

  @override
  void initState() {
    super.initState();

    _icon = Icons.play_arrow;

    _listener = () {
      setState(() {});
    };

    _controller = VideoPlayerController.asset("assets/videos/caspo_acnt_720p.mp4")
      ..addListener(_listener)
      ..setVolume(1.0)
      ..initialize();
  }

  @override
  void deactivate() {
    _controller.setVolume(0.0);
    _controller.removeListener(_listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: Center(
        // AspectRatio is basically container  // 16:9 (1920:1080, 1280:720)
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _controller != null ? VideoPlayer(_controller) : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_icon),
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
            _icon = Icons.play_arrow;
          } else {
            _controller.play();
            _icon = Icons.pause;
          }
        },
      ),
    );
  }
}
