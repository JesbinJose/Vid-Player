import 'package:flutter/material.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/screens/playlists.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/playlist/create_playlist_bottomsheet.dart';

class PlaylistDeleteAleartDialog extends StatelessWidget {
  const PlaylistDeleteAleartDialog({
    super.key,
    required this.index,
    required this.playLists,
    required this.instance,
  });
  final int index;
  final Map<String, List<String>> playLists;
  final PlaylistsScreenState instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.backgroundColor,
      content: Text(
        'Do you want to delete this playlist',
        style: MyTextStyles.textStyle3.copyWith(
          overflow: TextOverflow.visible,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:  Text(
            'No',
            style: MyTextStyles.textStyle3,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            MyBottomSheet.myBottomSheet(
              context,
              name: playLists.keys.toList()[index],
              isEdit: true,
              instance: instance,
            );
          },
          child:  Text(
            'Edit',
            style: MyTextStyles.textStyle3,
          ),
        ),
        TextButton(
          onPressed: () {
            PlayListDB.deletePlaylist(
              playLists.keys.toList()[index],
            ).then(
              (value) {
                Navigator.pop(context);
                instance.refresh();
              },
            );
          },
          child:  Text(
            'Delete',
            style: MyTextStyles.textStyle3,
          ),
        ),
      ],
    );
  }
}
