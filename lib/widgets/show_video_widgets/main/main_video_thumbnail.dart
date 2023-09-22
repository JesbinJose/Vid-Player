import 'package:flutter/material.dart';
import 'package:play_video/screens/fav_display.dart';
import 'package:play_video/screens/playlist_video_screen.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/dialoge_box/favourite_remove_dialoge_box.dart';
import 'package:play_video/widgets/dialoge_box/private_space_video_delete.dart';
import 'package:play_video/widgets/dialoge_box/single_video_dialogebox.dart';
import 'package:play_video/widgets/playlist/single_playlist.dart';
import 'package:play_video/widgets/show_video_widgets/main/show_thumbnail.dart';
import 'package:play_video/widgets/show_video_widgets/main/show_time_in_video.dart';

class MainVideoThumbnailPart extends StatelessWidget {
  const MainVideoThumbnailPart({
    super.key,
    required this.path,
    this.isHistory = false,
    this.favoriteInstance,
    this.playlistName,
    this.instance,
    this.playlistInstance,
    this.isPrivateSpace = false,
    this.privateSpaceInstace,
  });
  final String path;
  final bool isPrivateSpace;
  final bool isHistory;
  final FavoriteVideoScreenState? favoriteInstance;
  final PlayListVideoScreenState? instance;
  final SinglePlaylistState? playlistInstance;
  final PrivateSpaceShowVideoScreenState? privateSpaceInstace;
  final String? playlistName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: MyColors.primaryLightColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ShowThumbnail(
            path: path,
            isHistory: isHistory,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ShowTimeOfVideo(
            path: path,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            color: Colors.red,
            iconSize: 20,
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              if (isPrivateSpace) {
                showDialog(
                  context: context,
                  builder: (context) => PrivateSpaceDeleteVideoDialog(
                    path: path,
                    intance: privateSpaceInstace!,
                  ),
                );
              } else if (favoriteInstance == null) {
                showDialog(
                  context: context,
                  builder: (context) => MyDropDown(
                    path: path,
                    playlistName: playlistName,
                    instace: instance,
                    playlistInstance: playlistInstance,
                  ),
                );
              } else {
                FavouriteDeleteDialogeBox.dialogBox(
                  context,
                  path,
                  favoriteInstance!,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
