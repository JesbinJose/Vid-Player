import 'package:hive_flutter/adapters.dart';

class FavouritesDataBase {
  static late final Box box;
  //it is for loading the favourite data base
  static Future<void> loadFavDB() async {
    box = await Hive.openBox<String>('favourit_db');
  }
  //it is for add video into a favorite
  static Future<void> addVideo(String path) async {
    await box.put(path, 'temp');
  }
  //it is for checking if the video is already added to fav 
  static bool isPresent(String path) {
    return box.containsKey(path);
  }
  //it is for getting the full favourite as a list<String>
  static List<String> getFavLists() {
    List list = box.keys.toList();
    List<String> paths = [];
    for (var element in list) {
      paths.add(element.toString());
    }
    return paths;
  }
  //it is for removing from the favourites
  static Future<void> remove(String path) async {
    await box.delete(path);
  }
}
