import 'package:flutter/material.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/utils/styles/my_color_style.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class PlayListsDialogeBox extends StatelessWidget {
  const PlayListsDialogeBox({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    final List<String> playlistNames =
        PlayListDB.getFullPlaylist().keys.toList();
    return Dialog(
      backgroundColor: MyColors.backgroundColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        width: 250,
        child: playlistNames.isNotEmpty
            //if the play list is not empty then showing the playlist
            ? ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () async {
                    PlayListDB.addVideo(
                      path,
                      playlistNames[index],
                    ).then(
                      (value) => Navigator.pop(context),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: Text(
                      playlistNames[index],
                      style: MyTextStyles.textStyle3,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: playlistNames.length,
              )
            // if the playlist is empty then showing it to user
            :  Center(
                child: Text(
                  'The there are no Playlists ',
                  style: MyTextStyles.textStyle3,
                ),
              ),
      ),
    );
  }
}
