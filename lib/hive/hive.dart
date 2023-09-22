import 'package:play_video/hive/favourite.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/hive/mostly_played.dart';
import 'package:play_video/hive/playlists.dart';
import 'package:play_video/hive/private_space_db.dart';
import 'package:play_video/hive/theme_color.dart';
import 'package:play_video/hive/video_metadata.dart';

class MyHive {
  static loadAllDB() async {
    await ThemeColorDB.loadDB();
    await FavouritesDataBase.loadFavDB();
    await PlayListDB.loadDB();
    await VideoMetadataHive.loadDB();
    await HistoryDataBaseHive.loadDB();
    await MostlyPlayedDB.loadDB();
    await PrivateSpaceDb.loadDB();
  }
}
