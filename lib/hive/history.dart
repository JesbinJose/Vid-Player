import 'dart:io';

import 'package:hive_flutter/adapters.dart';

class HistoryDataBaseHive {
  static late Box box;
  static late Box boxWithHistoryPaths;
  static Future<void> loadDB() async {
    box = await Hive.openBox('history_db');
    boxWithHistoryPaths = await Hive.openBox('historydata_db');
    if (!boxWithHistoryPaths.keys.contains('history')) {
      await boxWithHistoryPaths.put('history', []);
    }
  }

  static Future<void> addVideo(String path, int time) async {
    List list = boxWithHistoryPaths.get('history');
    if (list.contains(path)) {
      list.remove(path);
    }
    list.add(path);
    await box.put(path, time);
    await boxWithHistoryPaths.put('history', list);
  }

  static List<String> getAllPaths() {
    List<String> list = [];
    for (final path in boxWithHistoryPaths.get('history')) {
      if (File(path).existsSync()) {
        list.add(path.toString());
      }
    }
    return list.reversed.toList();
  }

  static Future<int> getTime(String path) async {
    return await box.get(path);
  }

  static Future<void> removeVideo(String path) async {
    final List<String> list =
        List<String>.from(boxWithHistoryPaths.get('history'));
    list.remove(path);
    await boxWithHistoryPaths.put('history', list);
    await box.delete(path);
  }
}
