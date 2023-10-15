// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';

// class SilderWidget extends StatefulWidget {
//   const SilderWidget({Key key});

//   @override
//   State<SilderWidget> createState() => _SilderWidgetState();
// }

// class _SilderWidgetState extends State<SilderWidget> {
//   int currentPosition = 0;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: [
//         CarouselSlider(
//           items: [
//             //1st Image of Slider
//             Container(
//               margin: const EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://i.pinimg.com/originals/99/89/5d/99895dd02128847e1b0d8aee199b00ff.jpg"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),

//             //2nd Image of Slider
//             Container(
//               margin: const EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/66-fitness-motivation-%26-goals-design-template-047125dea2933bf434c306ee7c814081_screen.jpg?ts=1617103841"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),

//             //3rd Image of Slider
//             Container(
//               margin: const EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://i.ytimg.com/vi/TFO9hBtLVec/maxresdefault.jpg"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ],

//           //Slider Container properties
//           options: CarouselOptions(
//             height: 200.0,
//             enlargeCenterPage: true,
//             autoPlay: true,
//             aspectRatio: 16 / 9,
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enableInfiniteScroll: true,
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             viewportFraction: 0.8,
//             onPageChanged: ((index, reason) {
//               setState(() {
//                 currentPosition = index;
//                 // print("index: $currentPosition");
//               });
//             }),
//           ),
//         ),
//         DotsIndicator(
//           dotsCount: 5,
//           position: currentPosition.toDouble(),
//           decorator: DotsDecorator(
//             size: const Size.square(6.0),
//             activeSize: const Size(15.0, 6.0),
//             activeColor: Color(0xfff595b8),
//             color: Colors.black12,
//             activeShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


//////
///
///
//  Expanded(
//                 flex: 0,
//                 child: ToggleSwitch(
//                   minHeight: 35,
//                   cornerRadius: 20.0,
//                   activeBgColors: [
//                     [Colors.white],
//                     [Colors.white],
//                   ],
//                   activeFgColor: Colors.black,
//                   inactiveBgColor: Color.fromARGB(255, 216, 214, 222),
//                   inactiveFgColor: Colors.grey,
//                   initialLabelIndex: initialLabelIndex1,
//                   totalSwitches: 2,
//                   labels: ['kg', 'Ib'],
//                   radiusStyle: true,
//                   onToggle: (index) {
//                     setState(() {
//                        initialLabelIndex1 = index;
//                       print('switched-One to: $index');
//                     });
//                   },
//                 ),
//               ),


            // double i = double.parse(
            //                         kgWeightTextEditingController.text) /
            //                     2.205;
            //                 kgWeightTextEditingController =
            //                     TextEditingController(text: i.toString());

            //                 print("i: $i");
            //                 print(
                          