import 'package:hive/hive.dart';

class PlayListDB {
  static late Box box;
  //it is for loading data base
  static Future<void> loadDB() async {
    box = await Hive.openBox('playlist_db');
  }

  //its for create playlist
  static Future<void> addPlaylits(String playlistName, {List? list}) async {
    await box.put(playlistName, list ?? []);
  }

  //delete playlist
  static Future<void> deletePlaylist(String playlistName) async {
    await box.delete(playlistName);
  }

  //add video to playlist
  static Future<void> addVideo(String path, String playlistName) async {
    final List<dynamic> list = box.get(playlistName);
    if (!list.contains(path)) {
      list.add(path);
      await box.put(playlistName, list);
    }
  }

  //remove video
  static Future<void> removeVideo(String path, String playlistaName) async {
    final List<dynamic> list = box.get(playlistaName);
    list.remove(path);
    await box.put(playlistaName, list);
  }

  //get full data base as the playlist name and the videos in the playlist
  static Map<String, List<String>> getFullPlaylist() {
    final List list = box.keys.toList();
    Map<String, List<String>> playlists = {};
    for (String playlistName in list) {
      //getting single by single whole playlists
      List<dynamic> myList = box.get(playlistName);
      playlists[playlistName] = [];
      for (final path in myList) {
        playlists[playlistName]?.add(path.toString());
      }
    }
    return playlists;
  }

  static Future<void>deleteAVideoFromAllDataBase(String path) async {
    for (String playlistName in box.keys) {
      List list = box.get(playlistName);
      list.remove(path);
      await box.put(playlistName, list);
    }
  }
}
