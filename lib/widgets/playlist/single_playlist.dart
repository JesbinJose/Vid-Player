import 'package:flutter/material.dart';
import 'package:play_video/screens/playlist_video_screen.dart';
import 'package:play_video/utils/styles/styles.dart';

class SinglePlaylist extends StatefulWidget {
  const SinglePlaylist({
    super.key,
    required this.name,
    required this.videoPath,
  });
  final String name;
  final List<String> videoPath;

  @override
  State<SinglePlaylist> createState() => SinglePlaylistState();
}

class SinglePlaylistState extends State<SinglePlaylist> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //going to the screen where showing all videos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayListVideoScreen(
              paths: widget.videoPath,
              title: widget.name, instance: this,
            ),
          ),
        ).then((value) => refresh());
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(
              Icons.video_library_outlined,
              color: MyColors.iconsColor,
              size: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //playlist name with its lenght
                  '${widget.name} ${widget.videoPath.length}',
                  style: MyTextStyles.textStyle5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
