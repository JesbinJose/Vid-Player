import 'package:flutter/material.dart';
import 'package:play_video/hive/favourite.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';

class FavoriteVideoScreen extends StatefulWidget {
  const FavoriteVideoScreen({super.key});

  @override
  State<FavoriteVideoScreen> createState() => FavoriteVideoScreenState();
}

class FavoriteVideoScreenState extends State<FavoriteVideoScreen> {
  void refresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    final List<String> paths = FavouritesDataBase.getFavLists();
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          'Favourite',
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: paths.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: paths.length,
              itemBuilder: (context, index) => GestureDetector(
                onLongPress: () {},
                child: VideoSingleWidget(
                  isDefault: true,
                  videoPaths: paths,
                  index: index,
                  favoriteInstance: this,
                ),
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
            )
          :  Center(
            child: Text(
              'There is no Videos in Favorite',style: MyTextStyles.textStyle4,
            ),
          ),
    );
  }
}
