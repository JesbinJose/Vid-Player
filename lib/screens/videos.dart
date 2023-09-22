import 'package:flutter/material.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/screens/search.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';
import 'package:play_video/widgets/drop_down/sort_dropdown_items.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => VideosScreenState();
}

class VideosScreenState extends State<VideosScreen> {
  void refresh() {
    setState(() {});
  }

  static bool orderOfName = true;
  static bool orderOfTime = true;
  static bool orderOfSize = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Videos',
          style: TextStyle(),
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: PopupMenuButton<String>(
              color: MyColors.backgroundColor,
              child: const Icon(Icons.sort),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                ...List.generate(
                  VideoSortDropDownItems()
                      .myDropDownItems(instance: this)
                      .length,
                  (index) {
                    final item = VideoSortDropDownItems().myDropDownItems(
                      instance: this,
                    );
                    return item[index];
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchItems(
                  videoPaths: Mydata.videoPaths,
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      backgroundColor: MyColors.backgroundColor,
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 60),
        itemCount: Mydata.videoPaths.length,
        itemBuilder: (context, index) => VideoSingleWidget(
          videoPaths: Mydata.videoPaths,
          index: index,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
