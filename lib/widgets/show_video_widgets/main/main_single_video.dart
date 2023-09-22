import 'package:flutter/material.dart';
import 'package:play_video/screens/play_video_screen.dart';
import 'package:play_video/screens/playlist_video_screen.dart';
import 'package:play_video/screens/fav_display.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/playlist/single_playlist.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_video_thumbnail.dart';

class VideoSingleWidget extends StatelessWidget {
  const VideoSingleWidget({
    super.key,
    required this.videoPaths,
    required this.index,
    this.playlistName,
    this.instance,
    this.isDefault = false,
    this.favoriteInstance,
    this.isHistory = false,
    this.playlistInstance,
  });
  final bool isDefault;
  final List<String> videoPaths;
  final int index;
  final String? playlistName;
  final PlayListVideoScreenState? instance;
  final FavoriteVideoScreenState? favoriteInstance;
  final SinglePlaylistState? playlistInstance;
  final bool isHistory;

  @override
  Widget build(BuildContext context) {
    final videoPath = videoPaths[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          // screen for playing the video
          builder: (ctx) => PlayVideoScreen(
            path: videoPath,
            videoPaths: videoPaths,
          ),
        ),
      ),
      child: Column(
        children: [
          MainVideoThumbnailPart(
            instance: instance,
            playlistName: playlistName,
            favoriteInstance: favoriteInstance,
            playlistInstance: playlistInstance,
            isHistory: isHistory,
            path: videoPath,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              //getting name form the path
              videoPath.split('/').last,
              style: MyTextStyles.textStyle5,
            ),
          ),
        ],
      ),
    );
  }
}
