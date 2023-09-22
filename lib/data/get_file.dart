import 'dart:io';

import 'package:play_video/data/data.dart';

class GetParentFiles {
  static List<String> getParentFiles() {
    final videoPaths =
        Mydata.videoPaths; //getting all the video files from the storage
    List<String> filePaths = [];
    for (final path in videoPaths) {
      final pathRef = Directory(path);
      if (!filePaths.contains(pathRef.parent.path)) {
        // checking the files already contains if not contains it will add to filePaths
        filePaths.add(pathRef.parent.path);
      }
    }
    return filePaths;
  }
}
