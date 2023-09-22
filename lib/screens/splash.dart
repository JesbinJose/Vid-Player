import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/utils/work_during_splash.dart';

class SplashScreen extends StatelessWidget {
  //Splash screen
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SplashWorks.fetchFiles(context).then(
      (value) {},
    ); //calling the function to fetch the video files from internal storage
    return Container(
      color: Colors.yellow,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: MyColors.iconsColor,
                  backgroundColor: MyColors.backgroundColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
           SizedBox(
            width: 270,
            child: Text(
              'Fetching all video files from Storage',
              style: MyTextStyles.textStyle4,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
