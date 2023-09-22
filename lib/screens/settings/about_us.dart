import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/single_text_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.iconsColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'About Me',
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySingletextWidget(
                content:
                    'Hello guys, I am Jesbin.\nThis is my project, Video Player, which I made using Flutter, and I think you will be comfortable with this app.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'About me ',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'Say about me: I am a Flutter developer. Now working as an intern at Brototype TVM. About my education: I completed my 12th grade at Model Technical Higher Secondary School in Kaloor Erankulam, then joined Brotcamp. about the experience I had developing some projects in UI while on school time. as if I say about my passions and interests After this course, I want to join a company, and while doing work, I prefer to study Kotlin for native Android. Then go to college and join a college. During that time, I will study shift so I can become a native iOS developer, and after this, I can say I am a fully Flutter developer. ',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'App Details',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'As I said before, this is actually a project. that have some features that not all video players have.like the private space feature. This is not a feature to actually hide a video. This feature can be used if you don\'t want anyone else to watch that video, if we enable it in the app when you add videos to it. Other apps, like Gallary, can\'t play the video. There is one other feature that allows users to change the colours of the app as they want. ',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Contact me',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'Email:            jesbinjose57@gmail.com\nInstagram:       jesbin.tj\nPhone number:  +91 8848835567',
                isTitle: false,
              ),
              SizedBox(
                height: 10,
              ),
              MySingletextWidget(
                content:
                    'If you face any problems or bugs, or if you need any other features, etc., feel free to contact me. I\'ll update it as soon as possible.',
                isTitle: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
