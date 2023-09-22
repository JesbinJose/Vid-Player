import 'package:hive_flutter/adapters.dart';

class MostlyPlayedDB {
  static late Box box;
  static Future<void> loadDB() async {
    box = await Hive.openBox('mostlyplayed');
  }

  static Future<void> addVideo(String path) async {
    if (!box.keys.contains(path)) {
      await box.put(path, 1);
    } else {
      int value = box.get(path);
      value++;
      await box.put(path, value);
    }
  }

  static List<String> getAllVideos() {
    return List<String>.from(box.keys);
  }

  static List<String> sortMapByValues() {
    // Create a list of map entries
    List<String> list = List<String>.from(box.keys);
    list.sort(
      (a, b) {
        final int first = box.get(a);
        final int second = box.get(b);
        return second.compareTo(first);
      },
    );
    return list;
  }
}
