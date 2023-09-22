import 'package:flutter/material.dart';
import 'package:play_video/data/data.dart';
import 'package:play_video/data/get_file.dart';
import 'package:play_video/hive/history.dart';
import 'package:play_video/screens/history_screen.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/single_file.dart';

import '../widgets/show_video_widgets/single_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Mydata.filePaths=GetParentFiles.getParentFiles();
    List<String> history = HistoryDataBaseHive.getAllPaths();
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Home Screen',
          style: MyTextStyles.textStyle2,
        ),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
      ),
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height +
              (Mydata.filePaths.length > 4
                  ? ((Mydata.filePaths.length - 4) / 2) * 100
                  : 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (history.isNotEmpty)
                 Padding(
                  padding:const EdgeInsets.all(15),
                  child: Text(
                    'Recently Played',
                    style: MyTextStyles.textStyle2,
                  ),
                ),
              if (history.isNotEmpty)
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        //it is just fir loading only 10
                        history.length < 11 ? history.length : 10,
                        (index) => SingleVideoRecent(
                          videoPaths: history,
                          index: index,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryScreen(),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          width: 70,
                          height: 100,
                          child:  Center(
                            child: Icon(
                              Icons.history,
                              color: MyColors.iconsColor,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (history.isNotEmpty)
                 Padding(
                  padding:const EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    'Files',
                    style: MyTextStyles.textStyle2,
                  ),
                ),
              Expanded(
                //Files in gridview
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                  ),
                  itemCount: Mydata.filePaths.length,
                  itemBuilder: (context, index) {
                    return SingleFileWidget(
                      path: Mydata.filePaths[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
