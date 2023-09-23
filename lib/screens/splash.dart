import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          SizedBox(
            width: MediaQuery.sizeOf(context).width-50,
            child: const Text(
              'This process may take some time please wait',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width-50,
            child:const  Text(
              'Fetching all video files from Storage',
              style: TextStyle(fontSize: 15),
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
