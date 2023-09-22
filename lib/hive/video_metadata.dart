import 'package:hive_flutter/adapters.dart';

class VideoMetadataHive {
  static late Box box;
  static Future<void> loadDB() async {
    box = await Hive.openBox('videodata_db');
  }

  static Future<void> addVideo(String path, int time) async {
    await box.put(path, time);
  }

  static List getAllPaths() {
    return box.keys.toList();
  }

  static int getTime(String path)  {
    return  box.get(path);
  }
}
