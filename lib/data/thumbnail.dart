import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_compressor/video_compressor.dart';

class MyThumbnail {
  static final Directory _thumbnailFolder = Directory(
    //this is the directory where the thumbnails are created
    '/storage/emulated/0/Android/data/com.example.vid_play/files/video_compress',
  );

  static Future<String> myThumbnailAllFunction(String path) async {
    bool isAlreadyPresent = false;
    //getting the name of the file or video and remove mp4 to jpg
    final String name = '${path.split('/').last.split('.').first}.jpg';
    //checking weathe if the folder that contains the thumbnail is already present
    final bool isFolderPresent = _thumbnailFolder.existsSync();
    if (isFolderPresent) {
      //if the folder is present checking if thumbnail is present
      isAlreadyPresent = _isThumbnailPresent(name);
    }
    if (!isAlreadyPresent) {
      //if the thumbnail isn't present then
      await _generateThumbnail(path);
    }
    //returning the path of the thumbnail
    return '${_thumbnailFolder.path}/$name';
  }

  static bool _isThumbnailPresent(String name) {
    bool isPresent = false;
    _thumbnailFolder.listSync().forEach((element) {
      //checking every file in the folder if the thumbnail is present
      if (element.path.split('/').last == name) {
        isPresent = true;
      }
    });
    return isPresent;
  }

  static Future<void> _generateThumbnail(String path) async {
    //this is to making thumbnail of the videos
    try {
      await VideoCompressor.getFileThumbnail(
        path,
        quality: 25, //quality needed for the thumbnail
        position: 250, //position of the video where it want to make thumbnail
      );
    } catch (e) {
      debugPrint('The problem is in genrating thumbnail $e');
    }
  }
}
