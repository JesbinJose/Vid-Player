import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:play_video/data/thumbnail.dart';
import 'package:play_video/screens/play_video_screen.dart';
import 'package:play_video/utils/styles/my_text_style.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile(
      {super.key,
      required this.videoPaths,
      required this.index,
      required this.path});
  final List<String> videoPaths;
  final int index;
  final String path;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        child: FutureBuilder(
          future: MyThumbnail.myThumbnailAllFunction(path),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return Image.file(
                File(snapshot.data!),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              );
            } else {
              return const Icon(
                Icons.ondemand_video,
                size: 50,
              );
            }
          },
        ),
      ),
      title: SizedBox(
        height: 30,
        child: path.split('/').last.split('.').first.length > 20
            ? Marquee(
                decelerationDuration: Duration.zero,
                style: MyTextStyles.textStyle4,
                blankSpace: 50,
                velocity: 20,
                text: path.split('/').last.split('.').first,
                // text:
              )
            : Text(
              path.split('/').last.split('.').first,
              style: MyTextStyles.textStyle4,
            ),
      ),
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PlayVideoScreen(
            path: path,
            videoPaths: videoPaths,
          ),
        ),
      ),
    );
  }
}
