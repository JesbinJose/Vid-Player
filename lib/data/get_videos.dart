import 'dart:io';

import 'package:mime/mime.dart';
import 'package:play_video/data/data.dart';

class GetVideos {
  static Future<List<String>> getVideos() async {
    List<String> videoPaths = [];
    bool hasPermission = Mydata.permission;
    List<String> filePath = [];
    List<String> restrictedFiles = [
      //The restricted files if go inside i gave an excption
      '/storage/emulated/0/Android',
      '/storage/emulated/0/Android/obb',
      '/storage/emulated/0/Android/data'
    ];
    if (!hasPermission) {
      // it is just for a safety if the permisson is denid then just returning a empty list
      return [];
    }
    Directory root = Directory(
        '/storage/emulated/0/Android'); //finding all files in android folder
    root.listSync().forEach((element) {
      filePath.add(element.path);
    });
    root = Directory('/storage/emulated/0'); //finding files in the phone
    root.listSync().forEach((element) {
      filePath.add(element.path);
    });
    for (final resPath in restrictedFiles) {
      // removing all restricted files
      if (filePath.contains(resPath)) {
        filePath.remove(resPath);
      }
    }

    for (final path in filePath) {
      if (!path.split('/').last.startsWith('.')) {
        Directory root = Directory(path);
        root.listSync(recursive: true).forEach((element) {
          //scanning through all the files excepted the restricted ones
          final mimeType = lookupMimeType(element.path);
          if (mimeType != null &&
              mimeType.startsWith('video/') &&
              !element.path.contains('.trashed')) {
            //finding only videos from the internal storage and store to videoPaths List
            videoPaths.add(element.path);
          }
        });
      }
    }
    return videoPaths; //returning only the video files
  }
}
