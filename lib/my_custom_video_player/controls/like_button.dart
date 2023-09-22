import 'package:flutter/material.dart';
import 'package:play_video/hive/favourite.dart';
import 'package:play_video/hive/private_space_db.dart';
import 'package:play_video/my_custom_video_player/models/my_file.dart';

class VideoPlayerLikeButton extends StatefulWidget {
  const VideoPlayerLikeButton({super.key, required this.path});
  final String path;

  @override
  State<VideoPlayerLikeButton> createState() => _VideoPlayerLikeButtonState();
}

class _VideoPlayerLikeButtonState extends State<VideoPlayerLikeButton> {
  @override
  Widget build(BuildContext context) {
    if (PrivateSpaceDb.getHiddenVideoPaths().contains(widget.path)) {
      return const SizedBox();
    }
    return IconButton(
      onPressed: () async {
        !FavouritesDataBase.isPresent(
          MyFile.videoPaths[MyFile.index],
        )
            ? await FavouritesDataBase.addVideo(
                widget.path,
              )
            : await FavouritesDataBase.remove(
                widget.path,
              );
        bool isPresentFav = FavouritesDataBase.isPresent(widget.path);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 200),
            content: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  '${isPresentFav ? 'Added to' : 'Removed from'} favorites',
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        );
        setState(() {});
      },
      icon: Icon(
        !FavouritesDataBase.isPresent(widget.path)
            ? Icons.favorite_border_outlined
            : Icons.favorite_outlined,
        color: Colors.white,
      ),
    );
  }
}
