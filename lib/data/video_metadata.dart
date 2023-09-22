import 'package:play_video/hive/video_metadata.dart';
import 'package:video_compressor/video_compressor.dart';

class VideoMetaData {
  static Future<String> getTime(String path) async {
    if (VideoMetadataHive.getAllPaths().contains(path)) {
      final int time =  VideoMetadataHive.getTime(path);
      return _getDurationAsString(
        Duration(
          milliseconds: time,
        ),
      );
    } else {
      final mediaInfo = await VideoCompressor.getMediaInfo(path);
      await VideoMetadataHive.addVideo(path, mediaInfo.duration!.toInt());
      return _getDurationAsString(
        Duration(
          milliseconds: mediaInfo.duration!.toInt(),
        ),
      );
    }
  }

  static String _getDurationAsString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours);
    if (int.parse(twoDigitMinutes) < 0) {
      twoDigitMinutes = "00";
    }
    if (int.parse(twoDigitSeconds) < 0) {
      twoDigitSeconds = "00";
    }
    if (int.parse(twoDigitHours) < 0) {
      twoDigitHours = "00";
    }
    if (duration > const Duration(hours: 1)) {
      return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }
}
