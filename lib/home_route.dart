import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  /// Video player assets
  VideoPlayerController _controllerAsset;
  VoidCallback _listenerAsset;
  IconData _iconAsset = Icons.play_arrow;

  /// Video player network
  VideoPlayerController _controllerNetwork;
  VoidCallback _listenerNetwork;
  IconData _iconNetwork = Icons.play_arrow;

  @override
  void initState() {
    super.initState();

    _listenerAsset = () {
      setState(() {});
    };

    _controllerAsset = VideoPlayerController.asset("assets/videos/caspo_acnt_720p.mp4")
      ..addListener(_listenerAsset)
      ..setVolume(1.0)
      ..initialize();

    _listenerNetwork = () {
      setState(() {});
    };

    _controllerNetwork = VideoPlayerController.network("https://github.com/flutter/assets-for-api-docs/blob/master/assets/videos/butterfly.mp4?raw=true")
      ..addListener(_listenerNetwork)
      ..setVolume(1.0)
      ..initialize();
  }

  @override
  void deactivate() {
    _controllerAsset.setVolume(0.0);
    _controllerAsset.removeListener(_listenerAsset);

    _controllerNetwork.setVolume(0.0);
    _controllerNetwork.removeListener(_listenerNetwork);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),

            /// Video player assets
            Text("Assets"),

            SizedBox(height: 10.0),

            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _controllerAsset != null ? VideoPlayer(_controllerAsset) : Container(),
                ),
                FloatingActionButton(
                  child: Icon(_iconAsset),
                  onPressed: () {
                    if (_controllerAsset.value.isPlaying) {
                      _controllerAsset.pause();
                      _iconAsset = Icons.play_arrow;
                    } else {
                      _controllerAsset.play();
                      _iconAsset = Icons.pause;
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: 20.0),

            /// Video player network
            Text("Network"),

            SizedBox(height: 10.0),

            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _controllerNetwork != null ? VideoPlayer(_controllerNetwork) : Container(),
                ),
                FloatingActionButton(
                  child: Icon(_iconNetwork),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    if (_controllerNetwork.value.isPlaying) {
                      _controllerNetwork.pause();
                      _iconNetwork = Icons.play_arrow;
                    } else {
                      _controllerNetwork.play();
                      _iconNetwork = Icons.pause;
                    }
                  },
                ),
              ],
            ),
          ],
          // AspectRatio is basically container  // 16:9 (1920:1080, 1280:720)
        ),
      ),
    );
  }
}
