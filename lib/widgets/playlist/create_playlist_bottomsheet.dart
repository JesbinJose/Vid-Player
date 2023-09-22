import 'package:flutter/material.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/screens/playlists.dart';
import 'package:play_video/utils/styles/styles.dart';

class MyBottomSheet {
  static myBottomSheet(
    BuildContext context, {
    String? name,
    bool isEdit = false,
    PlaylistsScreenState? instance,
  }) {
    //show bottom sheet for adding playlist
    showModalBottomSheet(
      backgroundColor: MyColors.backgroundColor,
      context: context,
      builder: (context) {
        TextEditingController playlist = TextEditingController();
        if (name != null) {
          playlist.text = name;
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //getting playlist name from user
              TextField(
                controller: playlist,
                decoration:  InputDecoration(
                  hintText: 'Playlist name',
                  hintStyle: MyTextStyles.textStyle4,
                  border: const OutlineInputBorder(),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'Select Songs',
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  //checking if the given playlists is valid if valid then creating it
                  if (!isEdit) {
                    if (!PlayListDB.getFullPlaylist()
                            .keys
                            .contains(playlist.text) &&
                        playlist.text.isNotEmpty) {
                      PlayListDB.addPlaylits(
                        playlist.text,
                        list: [],
                      );
                      instance!.refresh();
                    } else {
                      //if the playlist name is not valid then showing snakbar
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(
                            'Please enter a valid playlist name',
                            style: MyTextStyles.textStyle4,
                          ),
                        ),
                      );
                    }
                  } else {
                    PlayListDB.addPlaylits(
                      playlist.text,
                      list: PlayListDB.getFullPlaylist()[name],
                    );
                    PlayListDB.deletePlaylist(name!);
                    instance?.refresh();
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  !isEdit ? 'Create playlist' : 'Change name',
                  style: MyTextStyles.textStyle4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
