
import 'package:bmicalculator/globally.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../Ads/adhepers.dart';
import '../ad_helper.dart';
import '../constants/color_constants.dart';
import 'how_to_use.dart';
import 'package:bmicalculator/globally.dart' as globals;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //loadAd();
   // AdHelpersofintnavive.loadInterstitialAd();
    //Load AppOpen Ad
    AdHelpersofintnavive.loadAd();

    //Show AppOpen Ad After 8 Seconds
    Future.delayed(const Duration(seconds: 3)).then((value) {
      //Here we will wait for 8 seconds to load our ad
      //After 8 second it will go to HomePage
      setState(() {
        globals.adcounter++;

      });
      print("counter$adcounter");
      AdHelpersofintnavive.showAdIfAvailable();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  HowToUsePage(),
        ),
      );

    });


  }


  /*loadAd()async{
    Future.delayed(Duration(seconds: 3),()async{
      await  _loadInterstitialAd();
      if(_interstitialAd!=null){
        _interstitialAd!.show();
      }
    });
  }*/

  InterstitialAd? _interstitialAd;
  AppOpenAd?  _appOpenAd;

  bool isADLoading = true;

   _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId!,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              // _moveToHome();
              print('_moveToHome');
            },
          );

          setState(() {
            _interstitialAd = ad;
            isADLoading = false;
          });
        },
        onAdFailedToLoad: (err) {

          setState(() {
            isADLoading = false;
          });
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      // backgroundColor: Color(0xffeae9ee),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Get.height*.3,),
          Center(
            child: Container(
              height: Get.height*.2,
              width: Get.width*.6,

              child: Image.asset(
                "assets/bmi_splash.png",
                height: 600,
                width: Get.width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 25,),
          RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "BMI ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: whiteColor),),
                  TextSpan(text: "Calculator",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: whiteColor)),
                ]
              ),
            
          ),


          SizedBox(height: 10,),
          Text("Health Monitor",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:blackColor),),
          // ReusableText(text: "BMI Calculator\n\nHealth Monitor",fontSize: 25,fontWeight: FontWeight.bold,),
          SizedBox(height: Get.height*.13,),
          isADLoading == true
              ? Column(
                  children: [
                    // Text(
                    //   'Loading...',
                    //   style: GoogleFonts.robotoSlab(
                    //     textStyle: Theme.of(context).textTheme.bodyLarge,
                    //     fontSize: 22,
                    //     color: Colors.black,
                    //     letterSpacing: 1.5,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        backgroundColor: blackColor,
                        // value: 1,
                        valueColor: AlwaysStoppedAnimation<Color>(orangeColor),
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 50,
                  width: Get.width*.5,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    color: homeBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                          blurRadius: 3.5,
                        color: blackColor
                      )
                    ],
                    gradient: RadialGradient(
                      radius: 2,
                        colors: [
                          whiteColor,
                      splashBackgroundColor,

                    ])

                  ),
                 child: TextButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                              'Ad is loading...',
                              style: GoogleFonts.robotoSlab(
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            )),
                            content: SizedBox(
                              height: 35,
                              width: 35,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                     /* Future.delayed(Duration(seconds: 2)).then((value) {
                        Get.back();
                        if (_interstitialAd != null) {
                          //AdHelpersofintnavive.showInterstitialAd();
                          //AdHelpersofintnavive.showAppOpenAd();
                          //_interstitialAd!.show();
                        } else {
                          // Fluttertoast.showToast(
                          //   msg: "Error: interstitialAd is null.",
                          //   backgroundColor: Colors.red,
                          //   textColor: Colors.white,
                          // );
                        }
                      }).then((value) {
                        Future.delayed(Duration(seconds: 1)).then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HowToUsePage(),
                            ),
                          );
                        });
                      });*/
                    },

                    child: Text(
                      'Continue',
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: blackColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
