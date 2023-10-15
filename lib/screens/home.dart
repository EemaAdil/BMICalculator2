
import 'package:bmicalculator/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl/intl.dart';

import '../Ads/adhepers.dart';
import '../Calculation/calculatethebmi.dart';
import '../ad_helper.dart';
import '../globally.dart';
import 'calculateresult.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver{
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    //loadAd();
    setState(() {
      AdHelpersofintnavive.loadAd();
      AdHelpersofintnavive.loadInterstitialAd();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      print("Resumed==========================");
      if(adRunning == false){
       AdHelpersofintnavive.showAdIfAvailable();
      }
      isPaused = false;
    }
  }

  TextEditingController textEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool newIb = false;
  bool newkg = false;
  bool newfitIn = false;
  bool newcm = false;

  TextEditingController kgWeightTextEditingController =
      TextEditingController(text: "75.00");
  TextEditingController height1TextEditingController =
      TextEditingController(text: "5");
  TextEditingController height11TextEditingController =
      TextEditingController(text: "9");

  TextEditingController cmTextEditingController =
      TextEditingController(text: "175.0");

  int initialLabelIndex1 = 0;
  int initialLabelIndex2 = 0;
  int initialLabelIndexforGender = 0;
  String useinitialLabelIndexforGender = '01';
  DateTime? date;
  // DateFormat format = new DateFormat("MMMM dd, yyyy");
  int _currentHorizontalIntValue = 20;

  InterstitialAd? _interstitialAd;

  bool isAdLoading = false;

  void _loadInterstitialAd() {
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
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

 /* @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffeae9ee),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 96,
          child: Padding(
            padding: const EdgeInsets.only(top: 25,right: 10,left: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,

              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:Get.width*.2),
                  child: Text(
                    'BMI Health Monitor',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(width: 25,),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(70),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      // SilderWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Weight",
                            style: GoogleFonts.robotoSlab(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            "Height",
                            style: GoogleFonts.robotoSlab(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),

                      /// weight and height TextField
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 60,
                                child: CupertinoTextField(
                                  onTap: () {
                                    if (double.parse(
                                            kgWeightTextEditingController
                                                .text) >
                                        95) {
                                      setState(() {
                                        kgWeightTextEditingController =
                                            TextEditingController(
                                                text: "95.00");
                                      });
                                      print("You enterd out of limit weight");
                                      Get.snackbar("Opps!",
                                          "Your enter out of limit keybord-input Thanks!");
                                    } else {
                                      print("You enterd accetable weight");
                                    }
                                  },

                                  onSubmitted: (value) {
                                    if (double.parse(
                                            kgWeightTextEditingController
                                                .text) >
                                        95) {
                                      setState(() {
                                        kgWeightTextEditingController =
                                            TextEditingController(
                                                text: "95.00");
                                      });
                                      print("You enterd out of limit weight");
                                      Get.snackbar("Opps!",
                                          "Your enter out of limit keybord-input Thanks!");
                                    } else {
                                      print("You enterd accetable weight");
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  controller: kgWeightTextEditingController,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  maxLength: 5,
                                  cursorWidth: 3,
                                  keyboardType: TextInputType.number,
                                  clearButtonMode: OverlayVisibilityMode.never,
                                  enableSuggestions: true,
                                  cursorHeight: 44.0,
                                  cursorColor: Colors.black,
                                  // padding: EdgeInsets.only(bottom: 0, left: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// height feilds
                          newcm == true
                              ? Expanded(
                                  child: SizedBox(
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CupertinoTextField(
                                        textAlign: TextAlign.center,
                                        controller: cmTextEditingController,
                                        style: GoogleFonts.robotoSlab(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          letterSpacing: 1.0,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        maxLength: 5,
                                        cursorWidth: 3,
                                        keyboardType: TextInputType.number,
                                        clearButtonMode:
                                            OverlayVisibilityMode.never,
                                        enableSuggestions: true,
                                        cursorHeight: 44.0,
                                        cursorColor: Colors.black,
                                        // padding: EdgeInsets.only(bottom: 0, left: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 60,
                                            child: CupertinoTextField(
                                              padding:
                                                  EdgeInsets.only(left: 18.0),
                                              suffix: Container(
                                                margin:
                                                    EdgeInsets.only(right: 18),
                                                child: Text(
                                                  "'",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.robotoSlab(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    letterSpacing: 1.0,
                                                  ),
                                                ),
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              controller:
                                                  height1TextEditingController,
                                              style: GoogleFonts.robotoSlab(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                letterSpacing: 1.0,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                              maxLength: 1,
                                              cursorWidth: 3,
                                              keyboardType:
                                                  TextInputType.number,
                                              clearButtonMode:
                                                  OverlayVisibilityMode.never,
                                              enableSuggestions: true,
                                              cursorHeight: 44.0,
                                              cursorColor: Colors.black,
                                              // padding: EdgeInsets.only(bottom: 0, left: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.0),
                                        Expanded(
                                          child: SizedBox(
                                            height: 60,
                                            child: CupertinoTextField(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              suffix: Container(
                                                margin:
                                                    EdgeInsets.only(right: 6),
                                                child: Text(
                                                  "''",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.robotoSlab(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    letterSpacing: 1.0,
                                                  ),
                                                ),
                                              ),
                                              textAlign: TextAlign.center,
                                              controller:
                                                  height11TextEditingController,
                                              style: GoogleFonts.robotoSlab(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                letterSpacing: 1.0,
                                              ),
                                              textInputAction:
                                                  TextInputAction.next,
                                              maxLength: 2,
                                              cursorWidth: 3,
                                              keyboardType:
                                                  TextInputType.number,
                                              clearButtonMode:
                                                  OverlayVisibilityMode.never,
                                              enableSuggestions: true,
                                              cursorHeight: 44.0,
                                              cursorColor: Colors.black,
                                              // padding: EdgeInsets.only(bottom: 0, left: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 10),

                      /// togllee buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 0,
                            child: ToggleSwitch(
                              minHeight: 35,
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [Colors.white],
                                [Colors.white],
                              ],
                              activeFgColor: Colors.black,
                              inactiveBgColor:
                                  Color.fromARGB(255, 216, 214, 222),
                              inactiveFgColor: Colors.grey,
                              initialLabelIndex: initialLabelIndex1,
                              totalSwitches: 2,
                              labels: ['kg', 'Ib'],
                              radiusStyle: true,
                              onToggle: (index) {
                                setState(() {
                                  initialLabelIndex1 = index!;
                                  print('switched-One to: $index');
                                });
                                //

                                if (initialLabelIndex1 == 0) {
                                  if (newkg == true) {
                                    print("allready ture value if");
                                  } else {
                                    setState(() {
                                      newkg = true;
                                      newIb = false;
                                    });
                                    double i = double.parse(
                                            kgWeightTextEditingController
                                                .text) /
                                        2.205;
                                    kgWeightTextEditingController =
                                        TextEditingController(
                                            text: i.toStringAsFixed(2));

                                    print("i: $i");
                                  }

                                  /////
                                } else if (initialLabelIndex1 == 1) {
                                  if (newIb == true) {
                                    print("allready ture value else");
                                  } else {
                                    setState(() {
                                      newkg = false;
                                      newIb = true;
                                    });
                                    double i = double.parse(
                                            kgWeightTextEditingController
                                                .text) *
                                        2.205;
                                    kgWeightTextEditingController =
                                        TextEditingController(
                                            text: i.toStringAsFixed(2));

                                    print("i: $i");
                                  }
                                }
                              },
                            ),
                          ),

                          // Height
                          Expanded(
                            flex: 0,
                            child: ToggleSwitch(
                              minHeight: 35,
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [Colors.white],
                                [Colors.white],
                              ],
                              activeFgColor: Colors.black,
                              inactiveBgColor:
                                  Color.fromARGB(255, 216, 214, 222),
                              inactiveFgColor: Colors.grey,
                              initialLabelIndex: initialLabelIndex2,
                              totalSwitches: 2,
                              labels: ['fit-in', 'cm'],
                              radiusStyle: true,
                              onToggle: (index) {
                                setState(() {
                                  initialLabelIndex2 = index!;
                                  print('switched-One to: $index');

                                  if (initialLabelIndex2 == 0) {
                                    if (newfitIn == true) {
                                      print("newfitIn allready ture value if");
                                    } else {
                                      setState(() {
                                        newfitIn = true;
                                        newcm = false;
                                      });

                                      var i = double.parse(
                                              cmTextEditingController.text) /
                                          2.54;

                                      print("i: $i");

                                      var ii = i / 12;

                                      ii = double.parse(
                                          ii.toString().split('.').first);

                                      print("ii: $ii");

                                      height1TextEditingController =
                                          TextEditingController(
                                              text: ii
                                                  .toString()
                                                  .split('.')
                                                  .first);

                                      print(
                                          "height1TextEditingController: ${height1TextEditingController.text}");

                                      i = i - 12 * ii;

                                      i = double.parse(
                                          i.toString().split('.').first);

                                      print("il : $i");

                                      height11TextEditingController =
                                          TextEditingController(
                                              text: i
                                                  .toString()
                                                  .split('.')
                                                  .first);
                                    }
                                  } else if (initialLabelIndex2 == 1) {
                                    if (newcm == true) {
                                      print("newcm allready ture value if");
                                    } else {
                                      setState(() {
                                        newcm = true;
                                        newfitIn = false;
                                      });

                                      double someofit = double.parse(
                                              height1TextEditingController
                                                  .text) *
                                          12;

                                      someofit = someofit +
                                          int.parse(
                                              height11TextEditingController
                                                  .text);

                                      someofit = someofit * 2.54;

                                      print(someofit);

                                      cmTextEditingController =
                                          TextEditingController(
                                        text: someofit.toStringAsFixed(1),
                                      );
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Date",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(129.0),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(129.0),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            await showCupertinoModalPopup<void>(
                                context: context,
                                builder: (_) {
                                  final size = MediaQuery.of(context).size;
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    height: size.height * 0.37,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              CupertinoButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              CupertinoButton(
                                                child: Text('Done'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(date);
                                                  setState(() {
                                                    if (date == null) {
                                                      date = DateTime.now();
                                                    } else {
                                                      print("today selected");
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 0,
                                          thickness: 1,
                                        ),
                                        Flexible(
                                          child: CupertinoDatePicker(
                                            initialDateTime: DateTime.now(),
                                            maximumDate: DateTime.now().add(
                                              Duration(days: 30),
                                            ),
                                            minimumDate: DateTime(2020, 1, 1),
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged: (value) {
                                              date = value;
                                              print("date: $date");
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (date == null) ...[
                                Center(
                                  child: Text(
                                    'Select Date',
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ] else ...[
                                Center(
                                  child: Text(
                                    date.toString().split(' ').first ==
                                            DateTime.now()
                                                .toString()
                                                .split(' ')
                                                .first
                                        ? "Today"
                                        : DateFormat.yMMMMd().format(date!),
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Age",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: NumberPicker(
                                value: _currentHorizontalIntValue,
                                minValue: 0,
                                maxValue: 100,
                                step: 1,
                                itemHeight: 1,
                                axis: Axis.horizontal,
                                selectedTextStyle: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                                textStyle: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  letterSpacing: 0.0,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _currentHorizontalIntValue = value;
                                    print(
                                        "_currentHorizontalIntValue init: $_currentHorizontalIntValue");
                                  });
                                }),
                          ),
                          Positioned(
                            top: 35,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: Color(0xFFA446A4),
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Expanded(
                        child: ToggleSwitch(
                          customTextStyles: [
                            GoogleFonts.robotoSlab(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.0,
                              color: Colors.grey,
                            ),
                          ],
                          radiusStyle: false,
                          minWidth: MediaQuery.of(context).size.width * 0.45,
                          initialLabelIndex: initialLabelIndexforGender,
                          cornerRadius: 20.0,
                          iconSize: 30,
                          activeFgColor: Color(0xFFA446A4),
                          inactiveBgColor: Color.fromARGB(255, 216, 214, 222),
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: ['Male', 'Female'],
                          icons: [
                            FontAwesomeIcons.mars,
                            FontAwesomeIcons.venus
                          ],
                          activeBgColors: [
                            [Colors.white],
                            [Colors.white]
                          ],
                          onToggle: (index) {
                            setState(() {
                              initialLabelIndexforGender = index!;
                            });
                            print(
                                "initialLabelIndexforGender: $initialLabelIndexforGender");
                            if (initialLabelIndexforGender == 0) {
                              setState(() {
                                useinitialLabelIndexforGender = '01';
                              });
                            } else if (initialLabelIndexforGender == 1) {
                              setState(() {
                                useinitialLabelIndexforGender = '11';
                              });
                            }

                            print(
                                'switched to: ${useinitialLabelIndexforGender.toString()}');
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      //////////////////////////////////// calculater button ////////////////////////////
                      SizedBox(height: 10),
                      newcm == true
                          ? Container(
                              height: 50,
                              width: Get.width * 0.9,
                              decoration: BoxDecoration(
                                color: Color(0xFFA446A4),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  splashFactory: NoSplash.splashFactory,
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(129.0),
                                      side: BorderSide.none,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_currentHorizontalIntValue < 10) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select age upto 10+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (date == null) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select Date",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (newcm == true &&
                                      double.parse(
                                              cmTextEditingController.text) <=
                                          50.0) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select CM upto 50.0+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (double.parse(
                                          kgWeightTextEditingController.text) <=
                                      10.0) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select weight upto 10+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (newIb == true &&
                                      double.parse(kgWeightTextEditingController
                                              .text) <=
                                          20.0) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select Ib weight upto 20.0+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else {
                                    var weightforPoundsValue = double.parse(
                                            kgWeightTextEditingController
                                                .text) /
                                        2.2;
                                    print(
                                        "weightforPoundsValue: $weightforPoundsValue");
                                    Calculatethebmi obj = Calculatethebmi(
                                      inputheight: int.parse(
                                          cmTextEditingController.text
                                              .toString()
                                              .split(".")
                                              .first),
                                      inputweight: newIb == true
                                          ? weightforPoundsValue
                                          : double.parse(
                                              kgWeightTextEditingController
                                                  .text),
                                      inputgender: int.parse(
                                          useinitialLabelIndexforGender),
                                      inputage: _currentHorizontalIntValue,
                                    );

                                    print(
                                        "_currentHorizontalIntValue last: $_currentHorizontalIntValue");

                                   /* if(_interstitialAd!=null){
                                      _interstitialAd!.show();

                                      setState(() {
                                        isAdLoading = true;
                                      });
                                    }*/

                                    Future.delayed(Duration(seconds: 1))
                                        .then((value) {
                                      setState(() {
                                        adcounter++;
                                      });
                                      print("counter$adcounter");
                                      if(adcounter%3==0){
                                        AdHelpersofintnavive.showInterstitialAd();
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              (CalculateResult(
                                            Calculatetheresult:
                                                obj.calculate_result(),
                                            checkthemass: obj.checkmass()!,
                                            givesuggestions: obj.suggestions()!,
                                            isInputweight: newIb == true
                                                ? weightforPoundsValue
                                                : double.parse(
                                                    kgWeightTextEditingController
                                                        .text),
                                            isGender: int.parse(
                                                useinitialLabelIndexforGender),
                                            isDate: date!,
                                          )),
                                        ),
                                      );
                                    });
                                  }
                                },
                                child: Text(
                                  "Calculate",
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Color(0xFFA446A4),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  splashFactory: NoSplash.splashFactory,
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(129.0),
                                      side: BorderSide.none,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Calculate",
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                onPressed: () async{
                                  FocusScope.of(context).unfocus();
                                  if (_currentHorizontalIntValue < 10) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select age upto 10+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (double.parse(
                                          kgWeightTextEditingController.text) <=
                                      10.0) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select weight upto 10+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (date == null) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select Date",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else if (newIb == true &&
                                      double.parse(kgWeightTextEditingController
                                              .text) <=
                                          20.0) {
                                    Get.closeAllSnackbars();
                                    Get.snackbar(
                                      'Opps!',
                                      "Please select Ib weight upto 20.0+",
                                      backgroundColor: Colors.black12,
                                      colorText: Colors.white,
                                    );
                                  } else {
                                    /// Converts Foot and Inches to Centimeters
                                    double convertFTtoCM(int foot) =>
                                        foot * 30.48;
                                    double convertINtoCM(double inch) =>
                                        inch * 2.54;
                                    var convertFtIntoCM = convertFTtoCM(
                                            int.parse(
                                                height1TextEditingController
                                                    .text)) +
                                        convertINtoCM(double.parse(
                                            height11TextEditingController
                                                .text));
                                    print(
                                        "convertFtIntoCM : ${convertFtIntoCM.toString().split(".").first}");

                                    var weightforPoundsValue = double.parse(
                                            kgWeightTextEditingController
                                                .text) /
                                        2.2;

                                    print(
                                        "weightforPoundsValue: $weightforPoundsValue");
                                    Calculatethebmi obj = Calculatethebmi(
                                      inputheight:
                                          // newfitIn == true
                                          //     ?
                                          int.parse(convertFtIntoCM
                                              .toString()
                                              .split(".")
                                              .first),
                                      // : int.parse(cmTextEditingController.text
                                      //     .toString()
                                      //     .split(".")
                                      //     .first),
                                      inputweight: newIb == true
                                          ? weightforPoundsValue
                                          : double.parse(
                                              kgWeightTextEditingController
                                                  .text),
                                      inputgender: int.parse(
                                          useinitialLabelIndexforGender),
                                      inputage: _currentHorizontalIntValue,
                                    );
                                    print(
                                        "_currentHorizontalIntValue last: $_currentHorizontalIntValue");

                                 /*   if(_interstitialAd!=null){
                                      setState(() {
                                        isAdLoading = true;
                                      });

                                       _interstitialAd!.show();
                                    }*/

                                    Future.delayed(Duration(seconds: 1))
                                        .then((value) {
                                      setState(() {
                                        adcounter++;
                                      });
                                      print("counter$adcounter");
                                      if(adcounter%3==0){
                                        AdHelpersofintnavive.showInterstitialAd();
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              (CalculateResult(
                                            Calculatetheresult:
                                                obj.calculate_result(),
                                            checkthemass: obj.checkmass(),
                                            givesuggestions: obj.suggestions(),
                                            isInputweight: newIb == true
                                                ? weightforPoundsValue
                                                : double.parse(
                                                    kgWeightTextEditingController
                                                        .text),
                                            isGender: int.parse(
                                                useinitialLabelIndexforGender),
                                            isDate: date!,
                                          )),
                                        ),
                                      );
                                    });
                                  }
                                },
                              ),
                            ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            isAdLoading == true
                ? AlertDialog(
                    title: Center(
                        child: Text(
                      'Ad is loading...',
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
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
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future myGenderDilog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 60,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Select Gender",
                  style: GoogleFonts.robotoSlab(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff93b2fe),
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff93b2fe),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'Okay',
                          style: GoogleFonts.robotoSlab(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
