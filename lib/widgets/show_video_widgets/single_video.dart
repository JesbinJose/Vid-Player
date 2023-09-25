import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_video/data/thumbnail.dart';
import 'package:play_video/screens/play_video_screen.dart';
import 'package:play_video/widgets/dialoge_box/single_video_dialogebox.dart';

class SingleVideoRecent extends StatelessWidget {
  const SingleVideoRecent(
      {super.key, required this.videoPaths, required this.index});
  final List<String> videoPaths;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        //calling my dropdown for more operations
        showDialog(
          context: context,
          builder: (context) => MyDropDown(
            path: videoPaths[index],
          ),
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //on tap calling the screen where video is played
            builder: (context) => PlayVideoScreen(
              isFullScren: true,
              path: videoPaths[index],
              //it is just for the video navigations
              videoPaths: videoPaths,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: FutureBuilder(
          //calling the function to get the thumbnail path
          future: MyThumbnail.myThumbnailAllFunction(videoPaths[index]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              //if the thumbnail is created the showing it on the ui
              return ClipRRect(
                borderRadius:
                    BorderRadius.circular(15), //to make the corner rounded
                clipBehavior: Clip.antiAlias,
                child:snapshot.data!=null? Image.file(
                  File(snapshot.data!),
                  width: 60, //setting the dimenssion to set a proper size
                  height: 100,
                  fit: BoxFit.cover,
                ):const SizedBox(),
              );
            } else {
              //if it is loading or has some error then showing user a plain space
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
