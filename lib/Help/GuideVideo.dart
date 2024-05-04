import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const GuideVideo());
}

class GuideVideo extends StatefulWidget {
  const GuideVideo({super.key});
  @override
  _GuideVideoState createState() => _GuideVideoState();
}

class _GuideVideoState extends State<GuideVideo> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("video/Video.mp4")
      ..initialize().then((_) {
        _videoPlayerController.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: const Text("User Guide"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_videoPlayerController.value.isPlaying) {
              _videoPlayerController.pause();
            } else {
              _videoPlayerController.play();
            }
          },
          child: VideoPlayer(_videoPlayerController),
        ),
      ),
    );
  }
}
