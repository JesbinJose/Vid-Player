import 'package:play_video/hive/video_metadata.dart';

class SortVideoByTime {
  static List<String> sortByTime(List<String> videoPaths, bool asce)  {
    videoPaths.sort((a, b) {
      final int first = VideoMetadataHive.getTime(a);
      final int second = VideoMetadataHive.getTime(b);
      if (asce) {
        return first.compareTo(second);
      } else {
        return second.compareTo(first);
      }
    });
    return videoPaths;
  }
}
