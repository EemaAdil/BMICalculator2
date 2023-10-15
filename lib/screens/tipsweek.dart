
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import '../Tips/tipspages.dart';
import '../components/calculatebutton.dart';
import 'daywisegaintips.dart';

class WeekTips extends StatefulWidget {
  @override
  _WeekTipsState createState() => _WeekTipsState();
}

class _WeekTipsState extends State<WeekTips> {
  // BannerAd bannerAd;
  // bool isloaded = false;
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: "ca-app-pub-5122520518983133/3054114229",
  //     listener: BannerAdListener(onAdLoaded: (ad) {
  //       setState(() {
  //         isloaded = true;
  //       });
  //       print("Banner Ad Loaded");
  //     }, onAdFailedToLoad: (ad, error) {
  //       ad.dispose();
  //     }),
  //     request: AdRequest(),
  //   );
  //   bannerAd.load();
  // }

  int daywisevalue=0;
  //

  // double percentForGainWeightDay1;
  // bool selectedTypeV1;

  // getStringForV1() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedTypeV1 = prefs.getBool('stringValueForV1') ?? false;
  //   });
  //   print("selectedTypeV1 : $selectedTypeV1");
  //   if (selectedTypeV1 == true) {
  //     percentForGainWeightDay1 = 25.0;
  //     print("percentForGainWeightDay1: $percentForGainWeightDay1");
  //   } else {
  //     percentForGainWeightDay1 = 0.0;
  //   }
  //   return selectedTypeV1;
  // }

  // bool selectedTypeVB1;

  // getStringForVB1() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedTypeVB1 = prefs.getBool('stringValueForVB1') ?? false;
  //   });

  //   if (selectedTypeVB1 == true) {
  //     if (percentForGainWeightDay1 == 25.0) {
  //       percentForGainWeightDay1 = 50.0;
  //     } else {
  //       percentForGainWeightDay1 = 25.0;
  //     }
  //   }
  //   print("selectedTypeVB1 : $selectedTypeVB1");
  //   return selectedTypeVB1;
  // }

  // @override
  // void initState() {
  //   getStringForV1();
  //   getStringForVB1();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     Color(0xff93b2fe),
            //     Color(0xffac7ffc),
            //     Color(0xfff595b8),
            //   ],
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Tips for Gain weight',
                  style: GoogleFonts.robotoSlab(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
                Icon(
                  Icons.wallet,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            calculate_button(
              leading: Icons.local_activity,
              trading: Icons.arrow_forward_ios,
              // trading: Container(
              //   child: CircularPercentIndicator(
              //     radius: 20.0,
              //     lineWidth: 4.0,
              //     animation: true,
              //     percent: percentForGainWeightDay1 == null
              //         ? 0 / 100
              //         : percentForGainWeightDay1 / 100,
              //     center: Text(
              //       percentForGainWeightDay1 == null
              //           ? "0%"
              //           : percentForGainWeightDay1.toString() + "%",
              //       style: TextStyle(
              //         fontSize: 8.0,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.black,
              //       ),
              //     ),
              //     backgroundColor: Colors.grey[300],
              //     circularStrokeCap: CircularStrokeCap.round,
              //     progressColor: Color(0xfff595b8),
              //   ),
              // ),
              buttontext: 'Day 1',
              onpresstap: () {
                daywisevalue = 1;
                Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Daygainwise(
                      day: obj.DayValue(),
                      tip1: obj.Tips1(),
                      tip2: obj.Tips2(),
                      tip3: obj.Tips3(),
                      exercise1: obj.Exercise1(),
                      exercise2: obj.Exercise2(),
                      exercise3: obj.Exercise3(),
                    ),
                  ),
                );
              },
            ),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 2',
                onpresstap: () {
                  daywisevalue = 2;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 3',
                onpresstap: () {
                  daywisevalue = 3;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 4',
                onpresstap: () {
                  daywisevalue = 4;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 5',
                onpresstap: () {
                  daywisevalue = 5;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 6',
                onpresstap: () {
                  daywisevalue = 6;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 7',
                onpresstap: () {
                  daywisevalue = 7;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 8',
                onpresstap: () {
                  daywisevalue = 8;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 9',
                onpresstap: () {
                  daywisevalue = 9;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            calculate_button(
                leading: Icons.local_activity,
                trading: Icons.arrow_forward_ios,
                buttontext: 'Day 10',
                onpresstap: () {
                  daywisevalue = 10;
                  Tipspages obj = Tipspages(valueoftheday: daywisevalue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Daygainwise(
                                day: obj.DayValue(),
                                tip1: obj.Tips1(),
                                tip2: obj.Tips2(),
                                tip3: obj.Tips3(),
                                exercise1: obj.Exercise1(),
                                exercise2: obj.Exercise2(),
                                exercise3: obj.Exercise3(),
                              )));
                }),
            // isloaded
            //     ? Container(
            //         height: 50,
            //         child: AdWidget(
            //           ad: bannerAd,
            //         ),
            //       )
            //     : SizedBox(
            //         height: 10,
            //       ),
          ],
        ),
      ),
    ); //Scaffold
  }
}
