// // import 'package:bmi/auth/auth_screen.dart';
// // import 'package:bmi/screens/splashscreen.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyDrawer extends StatefulWidget {
//   const MyDrawer({Key key}) : super(key: key);

//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   // User user = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.75,
//       child: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 60),
//             // user == null
//             //     ? 
//                 Container(
//                     height: 120,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60),
//                       color: Colors.grey,
//                     ),
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: 50,
//                     ),
//                   ),
//                 // : CircleAvatar(
//                 //     radius: 65,
//                 //     backgroundImage: NetworkImage(user.photoURL),
//                 //   ),
//             SizedBox(height: 15),
//             // user == null
//             //     ?
//                  TextButton(
//                     onPressed: () {
//                       // Navigator.pushReplacement(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => SignInScreen(),
//                       //   ),
//                       // );
//                     },
//                     child: Text(
//                       "Login",
//                       style: GoogleFonts.robotoSlab(
//                         textStyle: Theme.of(context).textTheme.bodyLarge,
//                         fontSize: 14,
//                         color: Color(0xfff595b8),
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),
//                 // : Text(
//                 //     user.displayName.toUpperCase(),
//                 //     style: GoogleFonts.robotoSlab(
//                 //       textStyle: Theme.of(context).textTheme.bodyLarge,
//                 //       fontSize: 14,
//                 //       color: Color(0xff93b2fe),
//                 //       letterSpacing: 0.5,
//                 //     ),
//                 //   ),
//             SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Divider(
//                 thickness: 2.5,
//               ),
//             ),
//             SizedBox(height: 30),
//             ListTile(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               leading: Icon(Icons.home_outlined, color: Color(0xff93b2fe)),
//               title: Text(
//                 "Home",
//                 style: GoogleFonts.robotoSlab(
//                   textStyle: Theme.of(context).textTheme.bodyLarge,
//                   fontSize: 12,
//                   color: Color(0xff93b2fe),
//                   letterSpacing: 0.5,
//                 ),
//               ),
//             ),
//             ListTile(
//               onTap: () async {
//                 final Uri url = Uri.parse(
//                   'https://mitpark.blogspot.com/2022/07/mitpark-apps-privacy-policy.html',
//                 );
//                 if (!await launchUrl(url)) {
//                   throw Exception(url);
//                 }
//               },
//               leading: Icon(Icons.policy_outlined, color: Color(0xff93b2fe)),
//               title: Text(
//                 "Privacy policy",
//                 style: GoogleFonts.robotoSlab(
//                   textStyle: Theme.of(context).textTheme.bodyLarge,
//                   fontSize: 12,
//                   color: Color(0xff93b2fe),
//                   letterSpacing: 0.5,
//                 ),
//               ),
//             ),
//             // user == null
//             //     ? Container()
//             //     : ListTile(
//             //         onTap: () async {
//             //           await FirebaseAuth.instance.signOut().whenComplete(() {
//             //             Navigator.pushReplacement(
//             //               context,
//             //               MaterialPageRoute(
//             //                 builder: (context) => Splash(),
//             //               ),
//             //             );
//             //           });
//             //         },
//             //         leading: Icon(Icons.exit_to_app_outlined,
//             //             color: Color(0xff93b2fe)),
//             //         title: Text(
//             //           "LogOut",
//             //           style: GoogleFonts.robotoSlab(
//             //             textStyle: Theme.of(context).textTheme.bodyLarge,
//             //             fontSize: 12,
//             //             color: Color(0xff93b2fe),
//             //             letterSpacing: 0.5,
//             //           ),
//             //         ),
//             //       ),
//             Spacer(),
//             Text(
//               "V 1.0.1",
//               style: GoogleFonts.robotoSlab(
//                 textStyle: Theme.of(context).textTheme.bodyLarge,
//                 fontSize: 12,
//                 color: Colors.grey,
//                 letterSpacing: 0.5,
//               ),
//             ),
//             SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
