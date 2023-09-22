import 'package:flutter/material.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/widgets/playlist/create_playlist_bottomsheet.dart';
import 'package:play_video/widgets/dialoge_box/playlist_delete_aleart_dialoge.dart';
import 'package:play_video/widgets/playlist/single_playlist.dart';

import '../utils/styles/styles.dart';

class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  State<PlaylistsScreen> createState() => PlaylistsScreenState();
}

class PlaylistsScreenState extends State<PlaylistsScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> playLists = PlayListDB.getFullPlaylist();
    List<String> keyList = playLists.keys.toList();
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Playlist',
          style: MyTextStyles.textStyle2,
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GridView.builder(
              itemCount: keyList.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onLongPress: () => showDialog(
                  context: context,
                  builder: (context) => PlaylistDeleteAleartDialog(
                    index: index,
                    playLists: playLists,
                    instance: this,
                  ),
                ),
                child: SinglePlaylist(
                  name: keyList[index],
                  videoPath: playLists[keyList[index]] ?? [],
                ),
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 90),
              child: FloatingActionButton(
                backgroundColor: MyColors.primaryColor,
                onPressed: () {
                  //showing bottomsheet for add in playlist
                  MyBottomSheet.myBottomSheet(context, instance: this);
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
