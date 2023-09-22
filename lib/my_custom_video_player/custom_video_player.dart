import 'package:flutter/material.dart';
import 'package:play_video/my_custom_video_player/custom_video_player_controller.dart';
import 'package:play_video/my_custom_video_player/embedded_video_player.dart';

class CustomVideoPlayer extends StatelessWidget {
  final CustomVideoPlayerController customVideoPlayerController;
  const CustomVideoPlayer({
    Key? key,
    required this.customVideoPlayerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EmbeddedVideoPlayer(
        isFullscreen: true,
        customVideoPlayerController: customVideoPlayerController,
      ),
    );
  }
}
