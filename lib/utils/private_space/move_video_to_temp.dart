import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_video/hive/private_space_db.dart';

class MoveVideo {
  static List<String> hiddenVideo = [];
  static Future<void> hideVideo(
    String path,
    final context,
  ) async {
    try {
      if (File(path).existsSync()) {
        await PrivateSpaceDb.addVideo(path);
        File(path).renameSync(path.split('.').first);
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong',
          ),
        ),
      );
    }
  }

  static Future<List<String>> getHiddenVideos() async {
    List<String> list = PrivateSpaceDb.getHiddenVideoPaths();
    List<String> paths = [];
    for (final String path in list) {
      try {
        File(path.split('.').first).renameSync(path);
        paths.add(path);
      } catch (_) {}
    }
    hiddenVideo.addAll(paths);
    hiddenVideo = hiddenVideo.toSet().toList();
    return hiddenVideo;
  }

  static hideAll() {
    for (final String path in hiddenVideo) {
      try {
        File(path).renameSync(path.split('.').first);
      } catch (_) {}
    }
  }

  static Future<void> unHideVideo(String path) async {
    hiddenVideo.remove(path);
    await PrivateSpaceDb.removeVideo(path);
    try {
      File(path.split('.').first).renameSync(path);
    } catch (_) {}
  }
}
