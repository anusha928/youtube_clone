// PASTEBIN
// API
// TOOLS
// FAQ
// paste
// Search...

// LOGIN SIGN UP
// Advertisement

// SHARE
// TWEET
// Guest User
// Untitled
// A GUEST
// OCT 30TH, 2022
// 3
// 0
// NEVER
// ADD COMMENT
// Not a member of Pastebin yet? Sign Up, it unlocks many cool features!
//  3.74 KB | None |  
     
// import 'package:flutter/material.dart';
// import 'package:youtube_clone/common/constants/assets.dart';
// import 'package:youtube_clone/common/constants/theme.dart';
 
// class VideoCard extends StatelessWidget {
//   const VideoCard({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     final String imageUrl =
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1aSFRgsNeRZBszlTKR72akN5j9aWOV-_PsaSdCZ6DqU9a2AXIeh3RRQLNI2XAN5dvgVQ&usqp=CAU";
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   child: Image.asset(
//                     Assets.facebook,
//                     height: 220,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   heightFactor: 2,
//                   child: Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: NetworkImage(imageUrl),
//                           fit: BoxFit.cover,
//                           opacity: 0.7),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 8.0,
//                   right: 8,
//                   child: Container(
//                     color: CustomTheme.primaryColor,
//                     padding: EdgeInsets.all(4),
//                     child: Text(
//                       "2.45",
//                       style: Theme.of(context)
//                           .textTheme
//                           .caption!
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => print("Navigate to profile"),
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: Image(
//                           height: 50,
//                           width: 50,
//                           image: NetworkImage(imageUrl),
//                         )),
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 "video.title",
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               child: Expanded(
//                                 child: Text("video.author.username"),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
 
