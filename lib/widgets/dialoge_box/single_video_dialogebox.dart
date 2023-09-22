import 'package:flutter/material.dart';
import 'package:play_video/hive/favourite.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/screens/playlist_video_screen.dart';
import 'package:play_video/screens/settings/private_space_password.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/widgets/dialoge_box/playlists_list_dialoge_box.dart';
import 'package:play_video/widgets/dialoge_box/widgets/my_custom_dialoge_textbutton.dart';
import 'package:play_video/widgets/playlist/single_playlist.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key,
    required this.path,
    this.playlistName,
    this.instace,
    this.playlistInstance,
  });
  final String path;
  final String? playlistName;
  final PlayListVideoScreenState? instace;
  final SinglePlaylistState? playlistInstance;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.backgroundColor,
      child: SizedBox(
        width: 150,
        height: 250,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  //add or removing from fav
                  FavouritesDataBase.isPresent(path)
                      ? FavouritesDataBase.remove(path)
                      : FavouritesDataBase.addVideo(path);
                  Navigator.pop(context);
                },
                child: MyCustomTextButtonChildForDialogeBox(
                  //showing according the video is present or not by that
                  playlistName: FavouritesDataBase.isPresent(path)
                      ? 'Remove from Fav'
                      : 'Add to Fav',
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () async {
                  if (playlistName == null) {
                    //showing the list of play list if there is any playlist present
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => PlayListsDialogeBox(
                        path: path,
                      ),
                    );
                  } else {
                    //from the playlist screen removing the playlist
                    Navigator.pop(context);
                    await PlayListDB.removeVideo(path, playlistName!);
                    instace!.refresh();
                    playlistInstance!.refresh();
                  }
                },
                child: MyCustomTextButtonChildForDialogeBox(
                  //showing the user according to add or remove from playlist
                  playlistName: playlistName == null
                      ? 'Add to playList'
                      : 'Remove from $playlistName',
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () async => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivateSpacePasswordScreen(
                      isHideVideoDirect: path,
                    ),
                  ),
                ),
                child: const MyCustomTextButtonChildForDialogeBox(
                  playlistName: 'Hide Video',
                ),
              ),
              // const Divider(),
              // TextButton(
              //   onPressed: () {},
              //   child: const MyCustomTextButtonChildForDialogeBox(
              //     playlistName: 'Add to Fav',
              //   ),
              // ),
              // const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
