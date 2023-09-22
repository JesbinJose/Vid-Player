import 'package:flutter/material.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/widgets/show_video_widgets/main/main_single_video.dart';

import '../utils/styles/styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,color: MyColors.iconsColor,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('History',style: MyTextStyles.textStyle2,),
        
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 60),
        itemCount: HistoryDataBaseHive.getAllPaths().length,
        itemBuilder: (context, index) => VideoSingleWidget(
          isHistory: true,
          videoPaths: HistoryDataBaseHive.getAllPaths(),
          index: index,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
