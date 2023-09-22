import 'package:flutter/cupertino.dart';
import 'package:play_video/my_custom_video_player/controls/all_controls_overlay.dart';
import 'package:play_video/my_custom_video_player/custom_video_player_controller.dart';
import 'package:play_video/my_custom_video_player/thumbnail.dart';
import 'package:video_player/video_player.dart';

class EmbeddedVideoPlayer extends StatefulWidget {
  final CustomVideoPlayerController customVideoPlayerController;
  final bool isFullscreen;

  const EmbeddedVideoPlayer({
    Key? key,
    required this.customVideoPlayerController,
    this.isFullscreen = false,
  }) : super(key: key);

  @override
  State<EmbeddedVideoPlayer> createState() => _EmbeddedVideoPlayerState();
}

class _EmbeddedVideoPlayerState extends State<EmbeddedVideoPlayer> {
  @override
  void initState() {
    super.initState();

    if (!widget.isFullscreen) {
      widget.customVideoPlayerController.updateViewAfterFullscreen =
          _updateVideoState;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.customVideoPlayerController.videoPlayerController.value
        .isInitialized) {
      return Expanded(
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: widget.isFullscreen
                    ? widget.customVideoPlayerController.videoPlayerController
                        .value.aspectRatio
                    : widget.customVideoPlayerController.customVideoPlayerSettings
                            .customAspectRatio ??
                        widget.customVideoPlayerController.videoPlayerController
                            .value.aspectRatio,
                child: Stack(
                  children: [
                    Container(
                      color: CupertinoColors.black,
                    ),
                    Center(
                      child: AspectRatio(
                        aspectRatio: widget.customVideoPlayerController
                            .videoPlayerController.value.aspectRatio,
                        child: IgnorePointer(
                          child: VideoPlayer(
                            widget.customVideoPlayerController
                                .videoPlayerController,
                          ),
                        ),
                      ),
                    ),
                    Thumbnail(
                      customVideoPlayerController:
                          widget.customVideoPlayerController,
                    ),
                  ],
                ),
              ),
            ),
            AllControlsOverlay(
              customVideoPlayerController: widget.customVideoPlayerController,
              updateVideoState: _updateVideoState,
            ),
          ],
        ),
      );
    } else {
      return widget.customVideoPlayerController.customVideoPlayerSettings
              .placeholderWidget ??
          const SizedBox.shrink();
    }
  }

  void _updateVideoState() {
    if (mounted) {
      setState(() {});
    }
  }
}
