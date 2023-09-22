import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/data/thumbnail.dart';
import 'package:play_video/utils/private_space/move_video_to_temp.dart';
import 'package:play_video/utils/private_space/private_space_show_video_screen.dart';
import 'package:play_video/utils/styles/styles.dart';

class PrivateSpaceSelectVideoDialog extends StatelessWidget {
  const PrivateSpaceSelectVideoDialog({super.key, required this.instace});
  final PrivateSpaceShowVideoScreenState instace;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: MyColors.backgroundColor,
        width: 250,
        height: 250,
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            onTap: () async {
              await MoveVideo.hideVideo(Mydata.videoPaths[index], context)
                  .then((value) {
                Navigator.pop(
                  context,
                );
              });
              await instace.refresh();
            },
            leading: FutureBuilder(
                future: MyThumbnail.myThumbnailAllFunction(
                  Mydata.videoPaths[index],
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CircleAvatar(
                      backgroundImage: FileImage(
                        File(
                          snapshot.data!,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
            title: Text(
              Mydata.videoPaths[index].split('/').last,
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: Mydata.videoPaths.length,
        ),
      ),
    );
  }
}
