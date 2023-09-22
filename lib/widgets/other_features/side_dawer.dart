// import 'package:flutter/material.dart';
// import 'package:play_video/screens/home.dart';
// import 'package:play_video/screens/playlists.dart';
// import 'package:play_video/screens/settings/settings.dart';
// import 'package:play_video/screens/videos.dart';
// import 'package:play_video/utils/styles/styles.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: MyColors.backgroundColor,
//       child: ListView(
//         children: [
//           SizedBox(
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 10,
//                   ),
//                   child: Image.asset(
//                     'lib/assets/ic_launcher.png',
//                     height: 50,
//                     width: 50,
//                   ),
//                 ),
//                 const Text(
//                   'Video Player',
//                   style: MyTextStyles.textStyle1,
//                 )
//               ],
//             ),
//           ),
//            Divider(
//             color: MyColors.secondaryColor,
//           ),
//           ListTile(
//             title: const Text(
//               'Favorite',
//               style: MyTextStyles.textStyle3,
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) => const HomeScreen(),
//                 ),
//               );
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text(
//               'Videos',
//               style: MyTextStyles.textStyle3,
//             ),
//            onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) => const VideosScreen(),
//                 ),
//               );
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text(
//               'PlayLists',
//               style: MyTextStyles.textStyle3,
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) => const PlaylistsScreen(),
//                 ),
//               );
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text(
//               'Settings',
//               style: MyTextStyles.textStyle3,
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) => const SettingsScreen(),
//                 ),
//               );
//             },
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }
// }
