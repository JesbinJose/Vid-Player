import 'package:flutter/material.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/screens/videos.dart';
import 'package:play_video/utils/sorting/sorting_mostly_played.dart';
import 'package:play_video/utils/sorting/sorting_name.dart';
import 'package:play_video/utils/sorting/sorting_size.dart';
import 'package:play_video/utils/sorting/sorting_time.dart';

class VideoSortDropDownItems {
  List<PopupMenuItem<String>> myDropDownItems({
    required VideosScreenState instance,
  }) =>
      [
        PopupMenuItem<String>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Name'),
              Icon(
                !VideosScreenState.orderOfName
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
              ),
            ],
          ),
          onTap: () {
            Mydata.videoPaths = SortListByName.sortVideos(
              Mydata.videoPaths,
              VideosScreenState.orderOfName,
            );
            instance.refresh();
            VideosScreenState.orderOfName = !VideosScreenState.orderOfName;
          },
        ),
        PopupMenuItem<String>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Time'),
              Icon(
                !VideosScreenState.orderOfTime
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
              ),
            ],
          ),
          onTap: () {
            Mydata.videoPaths = SortVideoByTime.sortByTime(
              Mydata.videoPaths,
              VideosScreenState.orderOfTime,
            );
            VideosScreenState.orderOfTime = !VideosScreenState.orderOfTime;
            instance.refresh();
          },
        ),
        PopupMenuItem<String>(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Size'),
              Icon(
                !VideosScreenState.orderOfSize
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
              ),
            ],
          ),
          onTap: () {
            Mydata.videoPaths = SortVideoBySize.sortVideo(
              Mydata.videoPaths,
              VideosScreenState.orderOfSize,
            );
            VideosScreenState.orderOfSize = !VideosScreenState.orderOfSize;
            instance.refresh();
          },
        ),
        PopupMenuItem<String>(
          onTap: () {
            SortByMoestlyPlayed.sortMapByValues();
            instance.refresh();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mostlty played'),
              Icon(Icons.arrow_upward),
            ],
          ),
        ),
      ];
}
