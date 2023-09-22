import 'package:flutter/material.dart';
import 'package:play_video/hive/favourite.dart';
import 'package:play_video/screens/fav_display.dart';

class FavouriteDeleteDialogeBox {
  static dialogBox(
      final context, final path, FavoriteVideoScreenState instance) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text('Do you want to remove'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              FavouritesDataBase.remove(path);
              Navigator.pop(context);
              instance.refresh();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
