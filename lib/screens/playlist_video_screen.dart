import 'package:flutter/material.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/playlist/single_playlist.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';

class PlayListVideoScreen extends StatefulWidget {
  const PlayListVideoScreen({
    super.key,
    required this.title,
    required this.paths,
    required this.instance,
  });
  final String title;
  final List<String> paths;
  final SinglePlaylistState instance;

  @override
  State<PlayListVideoScreen> createState() => PlayListVideoScreenState();
}

class PlayListVideoScreenState extends State<PlayListVideoScreen> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: PlayListDB.getFullPlaylist()[widget.title]?.length,
        itemBuilder: (context, index) => VideoSingleWidget(
          playlistInstance: widget.instance,
          playlistName: widget.title,
          instance: this,
          videoPaths:PlayListDB.getFullPlaylist()[widget.title]??[],
          index: index,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
