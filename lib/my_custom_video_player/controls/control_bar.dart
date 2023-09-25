import 'package:play_video/my_custom_video_player/controls/like_button.dart';
import 'package:play_video/my_custom_video_player/models/my_file.dart';
import 'package:play_video/screens/play_video_screen.dart';

import '../custom_video_player_controller.dart';
import 'package:flutter/material.dart';
import '../../../../my_custom_video_player/controls/fullscreen_button.dart';
import '../../../../my_custom_video_player/controls/play_button.dart';
import '../../../../my_custom_video_player/controls/progress_bar.dart';

class CustomVideoPlayerControlBar extends StatelessWidget {
  final CustomVideoPlayerController customVideoPlayerController;
  final Function updateVideoState;
  final Function fadeOutOnPlay;
  const CustomVideoPlayerControlBar({
    Key? key,
    required this.customVideoPlayerController,
    required this.updateVideoState,
    required this.fadeOutOnPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1;
    Color color2;
    if (MyFile.index >= 1) {
      color1 = Colors.white;
    } else {
      color1 = const Color.fromARGB(255, 137, 137, 137);
    }
    if (MyFile.index < MyFile.videoPaths.length - 1) {
      color2 = Colors.white;
    } else {
      color2 = const Color.fromARGB(255, 137, 137, 137);
    }
    return OrientationBuilder(builder: (context, orientation) {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: customVideoPlayerController
            .customVideoPlayerSettings.controlBarPadding,
        decoration: customVideoPlayerController
            .customVideoPlayerSettings.controlBarDecoration,
        child: Column(
          children: [
            if (orientation == Orientation.portrait)
              Row(
                children: [
                  if (customVideoPlayerController
                      .customVideoPlayerSettings.showDurationPlayed)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: ValueListenableBuilder<Duration>(
                        valueListenable:
                            customVideoPlayerController.videoProgressNotifier,
                        builder: ((context, progress, child) {
                          return Text(
                            getDurationAsString(progress),
                            style: customVideoPlayerController
                                .customVideoPlayerSettings
                                .durationPlayedTextStyle,
                          );
                        }),
                      ),
                    ),
                  Expanded(
                    child: CustomVideoPlayerProgressBar(
                      customVideoPlayerController: customVideoPlayerController,
                    ),
                  ),
                  if (customVideoPlayerController
                      .customVideoPlayerSettings.showDurationRemaining)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: ValueListenableBuilder<Duration>(
                        valueListenable:
                            customVideoPlayerController.videoProgressNotifier,
                        builder: ((context, progress, child) {
                          MyFile.timePlayedInMilliseconds =
                              progress.inMilliseconds;
                          return Text(
                            "-${getDurationAsString(customVideoPlayerController.videoPlayerController.value.duration - progress)}",
                            style: customVideoPlayerController
                                .customVideoPlayerSettings
                                .durationRemainingTextStyle,
                          );
                        }),
                      ),
                    ),
                ],
              ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: color1,
                    ),
                    onPressed: () {
                      if (color1 == Colors.white) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayVideoScreen(
                              isFullScren: true,
                              path: MyFile.videoPaths[MyFile.index - 1],
                              videoPaths: MyFile.videoPaths,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                if (customVideoPlayerController
                    .customVideoPlayerSettings.showPlayButton)
                  CustomVideoPlayerPlayPauseButton(
                    customVideoPlayerController: customVideoPlayerController,
                    fadeOutOnPlay: fadeOutOnPlay,
                  ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: color2,
                    ),
                    onPressed: () {
                      if (color2 == Colors.white) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayVideoScreen(
                              isFullScren: true,
                              path: MyFile.videoPaths[MyFile.index + 1],
                              videoPaths: MyFile.videoPaths,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                if (customVideoPlayerController
                        .customVideoPlayerSettings.showDurationPlayed &&
                    orientation == Orientation.landscape)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: ValueListenableBuilder<Duration>(
                      valueListenable:
                          customVideoPlayerController.videoProgressNotifier,
                      builder: ((context, progress, child) {
                        return Text(
                          getDurationAsString(progress),
                          style: customVideoPlayerController
                              .customVideoPlayerSettings
                              .durationPlayedTextStyle,
                        );
                      }),
                    ),
                  ),
                if (orientation == Orientation.landscape)
                  Expanded(
                    child: CustomVideoPlayerProgressBar(
                      customVideoPlayerController: customVideoPlayerController,
                    ),
                  ),
                if (customVideoPlayerController
                        .customVideoPlayerSettings.showDurationRemaining &&
                    orientation == Orientation.landscape)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: ValueListenableBuilder<Duration>(
                      valueListenable:
                          customVideoPlayerController.videoProgressNotifier,
                      builder: ((context, progress, child) {
                        return Text(
                          "-${getDurationAsString(customVideoPlayerController.videoPlayerController.value.duration - progress)}",
                          style: customVideoPlayerController
                              .customVideoPlayerSettings
                              .durationRemainingTextStyle,
                        );
                      }),
                    ),
                  ),
                if (orientation == Orientation.portrait) const Spacer(),
                VideoPlayerLikeButton(path:  MyFile.videoPaths[MyFile.index],),
                if (customVideoPlayerController
                    .customVideoPlayerSettings.showFullscreenButton)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                    child: CustomVideoPlayerFullscreenButton(
                      customVideoPlayerController: customVideoPlayerController,
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    });
  }

  String getDurationAsString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours);
    if (int.parse(twoDigitMinutes) < 0) {
      twoDigitMinutes = "00";
    }
    if (int.parse(twoDigitSeconds) < 0) {
      twoDigitSeconds = "00";
    }
    if (int.parse(twoDigitHours) < 0) {
      twoDigitHours = "00";
    }
    if (duration > const Duration(hours: 1)) {
      return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }
}
