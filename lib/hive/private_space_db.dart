import 'package:hive/hive.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/hive/favourite.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/hive/playlists.dart';

class PrivateSpaceDb {
  static late final Box box;
  static Future<void> loadDB() async {
    box = await Hive.openBox<String>('private_storage_db');
  }

  static Future<void> addVideo(String path) async {
    Mydata.videoPaths.remove(path);
    await FavouritesDataBase.remove(path);
    await HistoryDataBaseHive.removeVideo(path);
    await PlayListDB.deleteAVideoFromAllDataBase(path);
    await box.add(path);
  }

  static List<String> getHiddenVideoPaths() {
    return List<String>.from(box.values);
  }

  static Future<void> removeVideo(String path) async {
    final key = box.keyAt(box.values.toList().indexOf(path));
    await box.delete(key);
    Mydata.videoPaths.add(path);
  }

  static String getVideoPath(String hiddenPath) {
    return box.get(hiddenPath.toString());
  }
}
