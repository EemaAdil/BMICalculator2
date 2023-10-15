import 'dart:io';
import 'package:bmicalculator/screens/recent_history.dart';
import 'package:bmicalculator/screens/step_counts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Ads/adhepers.dart';
import '../globally.dart';
import 'charts/chart.dart';
import 'home.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key});

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var _currentIndex = 0;
  NativeAd? nativeAd;
  BannerAd? bannerAd;
  void updateVar(){
    setState(() {
      adRunning = true;
    });
  }
  void loadAd() async {
   nativeAd = await AdHelpersofintnavive.loadNativeAd(TemplateType.small);
   setState(() {});
  }
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    setState(() {
      //AdHelpersofintnavive.loadInterstitialAd();
      AdHelpersofintnavive.loadBannerAd();
    });
    loadAd();
    // loadAd();
    // BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitId,
    //   request: AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         _bannerAd = ad as BannerAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       print('Failed to load a banner ad: ${err.message}');
    //       ad.dispose();
    //     },
    //   ),
    // ).load();
  }

  /// Loads a native ad.
  // void loadAd() {
  //   nativeAd = NativeAd(
  //       adUnitId: AdHelper.nativeAdUnitId,
  //       listener: NativeAdListener(
  //         onAdLoaded: (ad) {
  //           debugPrint('$NativeAd loaded.');
  //           setState(() {
  //             _nativeAdIsLoaded = true;
  //           });
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           // Dispose the ad here to free resources.
  //           debugPrint('$NativeAd failed to load: $error');
  //           ad.dispose();
  //         },
  //       ),
  //       request: const AdRequest(),
  //       // Styling
  //       nativeTemplateStyle: NativeTemplateStyle(
  //           // Required: Choose a template.
  //           templateType: TemplateType.medium,
  //           // Optional: Customize the ad's style.
  //           mainBackgroundColor: Colors.purple,
  //           cornerRadius: 10.0,
  //           callToActionTextStyle: NativeTemplateTextStyle(
  //               textColor: Colors.cyan,
  //               backgroundColor: Colors.red,
  //               style: NativeTemplateFontStyle.monospace,
  //               size: 16.0),
  //           primaryTextStyle: NativeTemplateTextStyle(
  //               textColor: Colors.red,
  //               backgroundColor: Colors.cyan,
  //               style: NativeTemplateFontStyle.italic,
  //               size: 16.0),
  //           secondaryTextStyle: NativeTemplateTextStyle(
  //               textColor: Colors.green,
  //               backgroundColor: Colors.black,
  //               style: NativeTemplateFontStyle.bold,
  //               size: 16.0),
  //           tertiaryTextStyle: NativeTemplateTextStyle(
  //               textColor: Colors.brown,
  //               backgroundColor: Colors.amber,
  //               style: NativeTemplateFontStyle.normal,
  //               size: 16.0)))
  //     ..load();
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      HomeScreen(),
      RecentHistoryScreen(),
      LineChartSample2(),
      DailyStepsPage(),
    ];
    return WillPopScope(
      onWillPop: () => showExitPopup(context,nativeAd!),
     /* onWillPop: () {
        adRunning = true;
        print("runndddder$adRunning");
        return showExitPopup(context,nativeAd!);
        },*/
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // extendBody: true,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SalomonBottomBar(
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (i) {
              /*  setState(() {

                  _adcounter++;
                });
                print("counter$_adcounter");
                if(_adcounter%4==0){
                  AdHelpersofintnavive.showInterstitialAd();
                }*/
                setState(() {
                  _currentIndex = i;
                  adcounter++;
                });
                print("counter$adcounter");
                if(adcounter%3==0){

                  AdHelpersofintnavive.showInterstitialAd();
                }
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(
                      Icons.calculate_outlined,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Calculator",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 11,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  selectedColor: Color(0xFFA446A4),
                ),

                SalomonBottomBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(
                      Icons.speed_rounded,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "BMI",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 11,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  selectedColor: Color(0xFFA446A4),
                ),
                SalomonBottomBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(
                      Icons.graphic_eq,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Statistics",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 11,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  selectedColor: Color(0xFFA446A4),
                ),
                SalomonBottomBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(
                      Icons.directions_walk_rounded,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    "Steps",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 11,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                  selectedColor: Color(0xFFA446A4),
                ),
              ],
            ),
            // SizedBox(height: 10),
            // _bannerAd != null
            //     ? Align(
            //         alignment: Alignment.center,
            //         child: Container(
            //           width: _bannerAd.size.width.toDouble(),
            //           height: _bannerAd.size.height.toDouble(),
            //           child: AdWidget(
            //             ad: _bannerAd,
            //           ),
            //         ),
            //       )
            //     : Align(
            //         alignment: Alignment.center,
            //         child: Container(
            //             width: Get.width * 0.9,
            //             height: 40,
            //             child: Center(
            //               child: Text(
            //                 "Ad is loading...",
            //                 style: GoogleFonts.robotoSlab(
            //                   textStyle: Theme.of(context).textTheme.bodyLarge,
            //                   fontSize: 14,
            //                   color: Colors.black,
            //                   letterSpacing: 0.5,
            //                 ),
            //               ),
            //             )),
            //       )
          ],
        ),

        body: Center(
          child: widgetOptions.elementAt(_currentIndex),
        ),
      ),
    );
  }
}


bool _nativeAdIsLoaded = false;

Future<bool> showExitPopup(context, NativeAd nativeAd) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          // height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Do you want to exit?",
                style: TextStyle(),
              ),
              const SizedBox(height: 10),

              // _nativeAdIsLoaded == false
              //     ? ConstrainedBox(
              //         constraints: const BoxConstraints(
              //           minWidth: 320, // minimum recommended width
              //           minHeight: 90, // minimum recommended height
              //           maxWidth: 400,
              //           maxHeight: 200,
              //         ),
              //         child: Center(
              //           child: Text(
              //             'Ad is loading...',
              //             style: GoogleFonts.robotoSlab(
              //               textStyle: Theme.of(context).textTheme.bodyLarge,
              //               fontSize: 14,
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               letterSpacing: 0.5,
              //             ),
              //           ),
              //         ),
              //       )
              //     : ConstrainedBox(
              //         constraints: const BoxConstraints(
              //           minWidth: 320, // minimum recommended width
              //           minHeight: 90, // minimum recommended height
              //           maxWidth: 400,
              //           maxHeight: 200,
              //         ),
              //         child: nativeAd!=null?AdWidget(ad: nativeAd):Center(child: CircularProgressIndicator()),
              //       ),
              // const SizedBox(height: 10),
              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        adRunning = false;
                        print('yes selected');
                        // _bannerAd.dispose();
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade800,
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        adRunning = false;
                        print('no selected');
                        print("rhashdhasvunndddder$adRunning");
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: const Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
             Container(
               height:100,
               width:300,
               child: nativeAd == null ? SizedBox() : AdWidget(ad: nativeAd!),
             )
            ],
          ),
        ),
      );
    },
  );
}
