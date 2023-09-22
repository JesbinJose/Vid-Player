import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/hive/mostly_played.dart';
import 'package:play_video/my_custom_video_player/custom_video_player.dart';
import 'package:play_video/my_custom_video_player/custom_video_player_controller.dart';
import 'package:play_video/my_custom_video_player/models/custom_video_player_settings.dart';
import 'package:play_video/my_custom_video_player/models/my_file.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({
    super.key,
    required this.path,
    required this.videoPaths,
    this.isPrivateSpace = false,
  });
  final String path;
  final List<String> videoPaths;
  final bool isPrivateSpace;

  @override
  State<PlayVideoScreen> createState() => PlayVideoScreenState();
}

class PlayVideoScreenState extends State<PlayVideoScreen> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    MyFile.instance = this;
    super.initState();
    videoPlayerController = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) async {
        await WakelockPlus.enable();
        setState(() {});
      });
    //setting video custom controller
    _customVideoPlayerController = CustomVideoPlayerController(
      videoPaths: widget.videoPaths,
      //finding index of videopath from the list
      index: widget.videoPaths.indexOf(widget.path),
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        settingsButton: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }

  void refresh() => setState(() {});

  @override
  void dispose() async {
    super.dispose();
    await WakelockPlus.disable();
    if (MyFile.timePlayedInMilliseconds > 10 && !widget.isPrivateSpace) {
      await HistoryDataBaseHive.addVideo(
        widget.path,
        MyFile.timePlayedInMilliseconds,
      );
    }
    await MostlyPlayedDB.addVideo(widget.path);
    //dispose it for safety
    _customVideoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //making transparent for filling the remaining space
      backgroundColor: Colors.transparent,
      body: Center(
        child: CustomVideoPlayer(
          customVideoPlayerController: _customVideoPlayerController,
        ),
      ),
    );
  }
}
