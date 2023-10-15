// import 'package:bmi/auth/auth.dart';
// import 'package:bmi/screens/btm_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';


// class SignInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
// bool _isSigningIn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 16.0,
//             right: 16.0,
//             bottom: 20.0,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BottomNavBarScreen(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       "Skip",
//                       style: GoogleFonts.robotoSlab(
//                         textStyle: Theme.of(context).textTheme.bodyLarge,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red,
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               _isSigningIn == true
//                   ? Expanded(
                      // child: Lottie.asset(
                      //   "assets/lottie/walking-loading.json",
                      // ),
//                     )
//                   : Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             flex: 1,
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Image.asset(
//                                   "assets/icon.png",
//                                 )),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//               // GoogleSignInButton(),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: _isSigningIn
//                     ? Container()
//                     : OutlinedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.white),
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40),
//                             ),
//                           ),
//                         ),
//                         onPressed: () async {
//                           setState(() {
//                             _isSigningIn = true;
//                           });
//                           User user =
//                               await Auth.signInWithGoogle(context: context);

//                           setState(() {
//                             _isSigningIn = false;
//                           });

//                           if (user != null) {
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (context) => BottomNavBarScreen()),
//                             );
//                           }
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const <Widget>[
//                               Icon(
//                                 Icons.auto_fix_high,
//                                 color: Color(0xff93b2fe),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: Text(
//                                   'Sign in with Google',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.blueGrey,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class GoogleSignInButton extends StatefulWidget {
// //   @override
// //   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// // }

// // class _GoogleSignInButtonState extends State<GoogleSignInButton> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: _isSigningIn
// //           ? CircularProgressIndicator(
// //               color: Colors.red,
// //             )
// //           : OutlinedButton(
// //               style: ButtonStyle(
// //                 backgroundColor: MaterialStateProperty.all(Colors.white),
// //                 shape: MaterialStateProperty.all(
// //                   RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(40),
// //                   ),
// //                 ),
// //               ),
// //               onPressed: () async {
// //                 setState(() {
// //                   _isSigningIn = true;
// //                 });
// //                 User user = await Auth.signInWithGoogle(context: context);

// //                 setState(() {
// //                   _isSigningIn = false;
// //                 });

// //                 if (user != null) {
// //                   Navigator.of(context).pushReplacement(
// //                     MaterialPageRoute(
// //                         builder: (context) => BottomNavBarScreen()),
// //                   );
// //                 }
// //               },
// //               child: Padding(
// //                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: const <Widget>[
// //                     Icon(
// //                       Icons.auto_fix_high,
// //                       color: Color(0xff93b2fe),
// //                     ),
// //                     Padding(
// //                       padding: EdgeInsets.only(left: 10),
// //                       child: Text(
// //                         'Sign in with Google',
// //                         style: TextStyle(
// //                           fontSize: 15,
// //                           color: Colors.blueGrey,
// //                           fontWeight: FontWeight.w600,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }
