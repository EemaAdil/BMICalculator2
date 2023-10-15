
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Ads/adhepers.dart';
import '../globally.dart';
import '../widget/reusable_text.dart';
import 'btm_screen.dart';
import 'package:bmicalculator/globally.dart' as globals;

class HowToUsePage extends StatefulWidget {
  @override
  _HowToUsePageState createState() => _HowToUsePageState();
}
class _HowToUsePageState extends State<HowToUsePage> {
  /*void loadAd() async {
    await AdHelpersofintnavive.loadInterstitialAd();
    setState(() {});
  }*/
  @override
  void initState() {
    super.initState();
    //loadAd();
    setState(() {
      AdHelpersofintnavive.loadInterstitialAd();
    });
  }
    @override
    Widget build(BuildContext context) {
      Color iconColor = Color(0xff154c79);
      double height = 20;
      double textSizedBoxHeight = 10;
      return Scaffold(
        backgroundColor: Color(0xffeae9ee),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(

                      children: [

                        FaIcon(FontAwesomeIcons.lightbulb, size: 30,
                          color: iconColor,),
                        SizedBox(height: height),
                        FaIcon(FontAwesomeIcons.weightScale, color: iconColor),

                        SizedBox(height: height),

                        FaIcon(FontAwesomeIcons.personArrowUpFromLine,
                            color: iconColor),
                        SizedBox(height: height),
                        FaIcon(FontAwesomeIcons.calendar, color: iconColor),
                        SizedBox(height: height),
                        FaIcon(FontAwesomeIcons.arrowsUpDown, color: iconColor),
                        SizedBox(height: height),
                        FaIcon(FontAwesomeIcons.person, color: iconColor),
                        SizedBox(height: height),
                        FaIcon(FontAwesomeIcons.check, color: iconColor),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ReusableText(
                            text: 'How to use:',
                            fontSize: 20,
                          ),
                          SizedBox(height: 25),
                          ReusableText(
                              text: 'Enter your weight in kg or lb.'
                          ),
                          SizedBox(height: 25),
                          ReusableText(
                              text: 'Height in cm or ft-in.'
                          ),
                          SizedBox(height: 20),
                          ReusableText(
                              text: 'Select a date.'
                          ),
                          SizedBox(height: 20),
                          ReusableText(
                              text: 'Select your age from the scroll bar.'
                          ),
                          SizedBox(height: 20),
                          ReusableText(
                              text: 'Select your gender and click calculate.'
                          ),
                          SizedBox(height: 10),
                          ReusableText(
                              text: 'Please do check out our universal Diet and exercise plan for over weight and under-weight.'
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * .35),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: iconColor,
                  ),
                  child: TextButton(
                    //on Button pressed
                   onPressed: () {
                     setState(() {
                          adcounter++;
                         });
                      print("counter$adcounter");
                      /* if(adcounter%3==0){
                        AdHelpersofintnavive.showInterstitialAd();
                        }*/
                          Future.delayed(const Duration(seconds: 1)).then((value) {
                           // AdHelpersofintnavive.showInterstitialAd();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBarScreen(),
                                // builder: (context) => const HowToUsePage(),
                              ),
                            );
                         });
                       },
                    child: Text(
                      "Let's Calculate your BMI",
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

