import 'package:play_video/data/data.dart';
import 'package:play_video/hive/mostly_played.dart';

class SortByMoestlyPlayed {
  static void sortMapByValues() {
    for (final String key in Mydata.videoPaths) {
      if (MostlyPlayedDB.getAllVideos().contains(key)) {
        Mydata.videoPaths.remove(key);
      }
    }
    Mydata.videoPaths = [
      ...MostlyPlayedDB.sortMapByValues(),
      ...Mydata.videoPaths,
    ];
  }
}
