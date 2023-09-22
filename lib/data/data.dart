import 'package:play_video/data/get_videos.dart';
import 'package:play_video/utils/private_space/private_space_shared_pref.dart';

class Mydata {
  //all data
  static List<String> videoPaths = [];
  static List<String> filePaths = [];
  static bool permission = false;
  static int version = 12;
  static String tempPath = '';

  static Future<void> myData() async {
    videoPaths = await GetVideos.getVideos();
    await MyPrivateSpace.loadSharedPref();
  }
}
