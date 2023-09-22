import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_video/data/thumbnail.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/hive/video_metadata.dart';
import 'package:play_video/utils/styles/my_color_style.dart';

class ShowThumbnail extends StatelessWidget {
  const ShowThumbnail({
    super.key,
    required this.path,
    required this.isHistory,
  });
  final String path;
  final bool isHistory;

  @override
  Widget build(BuildContext context) {
    Future<double> getIsPlayedValue() async =>
        await HistoryDataBaseHive.getTime(path) /
         VideoMetadataHive.getTime(path);
    return FutureBuilder(
      future: MyThumbnail.myThumbnailAllFunction(
        path,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Image.file(
                  File(snapshot.data!),
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                if (isHistory)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder(
                        future: getIsPlayedValue(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return LinearProgressIndicator(
                              backgroundColor: MyColors.primaryColor,
                              color: MyColors.iconsColor,
                              value: snapshot.data,
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
