import 'package:flutter/material.dart';
import 'package:play_video/utils/styles/styles.dart';
import 'package:play_video/widgets/single_text_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
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
        title:  Text(
          'Privacy policy',
          style: MyTextStyles.textStyle2,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //why need privacy policy
              MySingletextWidget(
                content: 'Why need this Privacy Policy',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'This privacy policy is to inform you about what we are doing. There are many other things that we need to give you a good software experience.',
                isTitle: false,
              ),
              //Information Collection
              MySingletextWidget(
                content: 'Information Collection',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'Personal Information',
              ),
              MySingletextWidget(
                content:
                    'We are not collecting any personal information or data from the phone. We are collecting videos from the internal storage and also storing the history of which videos are played in this app to add the history feature.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Non-Personal Information',
              ),
              MySingletextWidget(
                content:
                    'We are collecting Android versions to make the performance of the application better.',
                isTitle: false,
              ),
              //Data usage
              MySingletextWidget(
                content: 'Data Usage',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'We are collecting the video from the internal storage to show it to you. The data itself is stored on your phone. Storing the played video is for getting the history feature.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Data Protection',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'The data is itself stored in the device itself, and we are not sharing any data outside the phone. This app doesn\'t need a connection to the internet, so we are not getting or sending any data.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'User Controls',
                isTitle: true,
              ),
              MySingletextWidget(
                content:
                    'In this app, we are providing a lot of user customization, like the user can even choose the theme itself, and the data is stored in the app directory, so if the user wants to clear it, just clear the data of the app.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Permissions',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'This app needs only two permissions.',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'Read Video or Read Storage',
              ),
              MySingletextWidget(
                content:
                    'This is the permission that is strictly required for running this app. The video permission is for Android 13 or 13+, and the storage permission is for Android 12 and 12 below for fetching video files from the storage.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Manage Storage',
              ),
              MySingletextWidget(
                content:
                    'It is only asked when you try to assess the private space. If you need the private space feature, you need to allow it. As it is only for hiding videos.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Children\'s Privacy',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'As this app doesn\'t have a connection to the internet. Persons aged 3+ can simply use the app.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Legal Compliance',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'We are not sharing any data outside and are also not storing any sensitive user data.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Contact Information',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'Contact me on \n\n Email : jesbinjose86@gmail.com \n\n Instagram : jesbin.tj \n\n Please contact us if you face any problems (bugs) or have anything you would like to include in the app.',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Effective Data',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'This privacy policy where last updated in 15/09/2023',
                isTitle: false,
              ),
              MySingletextWidget(
                content: 'Consent',
                isTitle: true,
              ),
              MySingletextWidget(
                content: 'By using this app, the user agrees to all the statements above or in the privacy policy.',
                isTitle: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
