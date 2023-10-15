import 'dart:math';

import 'package:bmicalculator/screens/tipslooseweek.dart';
import 'package:bmicalculator/screens/tipsweek.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'history.dart';

class RecentHistoryScreen extends StatefulWidget {
  const RecentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<RecentHistoryScreen> createState() => _RecentHistoryScreenState();
}

class _RecentHistoryScreenState extends State<RecentHistoryScreen> {
  @override
  void initState() {
    super.initState();
    getweightStatus();
    getpercentStatus();
    getgivesuggestionStatus();
  }

  String weightStatusValue = '';
  getweightStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      weightStatusValue =
          prefs.getString('stringValueForweightStatus') ?? "null";
    });
    print("weightStatusValue : $weightStatusValue");
    return weightStatusValue;
  }

  String percentStatusValue = '';
  getpercentStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      percentStatusValue =
          prefs.getString('stringValueForPercentStatus') ?? "null";
    });
    print("percentStatusValue : $percentStatusValue");
    return percentStatusValue;
  }

  String givesuggestionStatusValue = '';
  getgivesuggestionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      givesuggestionStatusValue =
          prefs.getString('stringValueForgivesuggestionStatus') ?? "null";
    });
    print("givesuggestionStatusValue : $givesuggestionStatusValue");
    return givesuggestionStatusValue;
  }

  @override
  Widget build(BuildContext context) {
    final size = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) -
        50;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RECENT BMI',
                  style: GoogleFonts.robotoSlab(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "History",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 14,
                      color: Colors.blue,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (weightStatusValue == "null" ||
                    percentStatusValue == "null" ||
                    givesuggestionStatusValue == 'null')
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Lottie.asset(
                            'assets/lottie/step-animation.json',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Add Calculate activity First to See Recently BMI",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: size,
                          height: size,
                          child: Container(
                            child: SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  maximumLabels: 3,
                                  minimum: 0,
                                  maximum: 60,
                                  labelOffset: 35,
                                  canRotateLabels: false,
                                  showLastLabel: true,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                      // label: "0-16%",
                                      // labelStyle: GaugeTextStyle(fontSize: 8),
                                      startValue: 0,
                                      endValue: 16,
                                      // startWidth: 5,
                                      // endWidth: 5,
                                      color: Colors.blue,
                                    ),
                                    GaugeRange(
                                      // label: "16-17%",
                                      // labelStyle: GaugeTextStyle(fontSize: 8),
                                      startValue: 16,
                                      endValue: 17,
                                      // startWidth: 5,
                                      // endWidth: 5,
                                      color: Colors.blue,
                                    ),
                                    GaugeRange(
                                      startValue: 17,
                                      endValue: 18,
                                      // startWidth: 5,
                                      // endWidth: 5,
                                      color: Colors.blue,
                                    ),
                                    GaugeRange(
                                      startValue: 16,
                                      endValue: 26,
                                      // startWidth: 40,
                                      // endWidth: 40,
                                      color: Colors.green,
                                    ),
                                    GaugeRange(
                                      startValue: 26,
                                      endValue: 30,
                                      // startWidth: 40,
                                      // endWidth: 40,
                                      color: Colors.yellow,
                                    ),
                                    GaugeRange(
                                      startValue: 30,
                                      endValue: 34,
                                      // startWidth: 40,
                                      // endWidth: 40,
                                      color: Colors.orange,
                                    ),
                                    GaugeRange(
                                      startValue: 34,
                                      endValue: 40,
                                      // startWidth: 40,
                                      // endWidth: 40,
                                      color: Colors.orange[700],
                                    ),
                                    GaugeRange(
                                      startValue: 40,
                                      endValue: 60,
                                      // startWidth: 40,
                                      // endWidth: 40,
                                      color: Colors.red,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                      enableAnimation: true,
                                      enableDragging: true,
                                      animationDuration: 3000,
                                      needleLength: 0.5,
                                      value: percentStatusValue == ""
                                          ? 0.0
                                          : double.parse(percentStatusValue),
                                    ),
                                  ],
                                  // "${percentStatusValue + '%'}",
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      widget: Container(
                                        child: Text(
                                          "${percentStatusValue}",
                                          style: GoogleFonts.robotoSlab(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            fontSize: 26,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      angle: 90,
                                      positionFactor: 0.5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///

                        weightStatusValue == "Normal"
                            ? Container(
                                height: 60,
                                width: Get.width * 0.6,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "Congratulation\nYOU'R NORMAL",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      fontSize: 14,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              )
                            : weightStatusValue == "Over Weight"
                                ? Container(
                                    height: 60,
                                    width: Get.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WeeklooseTips()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "OVER WEIGHT ?",
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            "Tips to lose weight",
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              fontSize: 11,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 60,
                                    width: Get.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WeekTips()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "UNDER WEIGHT ?",
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            "Tips to gain weight",
                                            style: GoogleFonts.robotoSlab(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              fontSize: 11,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                        SizedBox(height: 20),
                        // information text here.
                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Color(0xFF0954D4))),
                            Expanded(
                              child: Text(
                                "Very severely underweight",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("<16")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Colors.blueAccent)),
                            Expanded(
                              child: Text(
                                "Severely underweight",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("<16-16.9")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                                    radius: 6, backgroundColor: Colors.blue)),
                            Expanded(
                              child: Text(
                                "Underweight",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("<17-18.4")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.green,
                            )),
                            Expanded(
                              child: Text(
                                "Normal",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("<16.5-26.6")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.yellow,
                            )),
                            Expanded(
                              child: Text(
                                "Overweight",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("<26.6-60.6")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.orange,
                            )),
                            Expanded(
                              child: Text(
                                "Obese Class I",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("30.0-34.9")),
                          ],
                        ),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.orange[800],
                            )),
                            Expanded(
                              child: Text(
                                "Obese Class II",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text("35.0-39.9")),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.red,
                            )),
                            Expanded(
                              child: Text(
                                "Obese Class III",
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 12,
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Expanded(child: Text(">40.0")),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 30),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //

  buildBottomSheetForInfo() {
    final size = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) -
        100;
    return Get.bottomSheet(
        Container(
          height: Get.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "BMI FOR ADULTS",
                style: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size,
                height: size,
                child: Container(
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        maximumLabels: 3,
                        minimum: 0,
                        maximum: 60,
                        labelOffset: 35,
                        canRotateLabels: false,
                        showLastLabel: true,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            // label: "0-16%",
                            // labelStyle: GaugeTextStyle(fontSize: 8),
                            startValue: 0,
                            endValue: 16,
                            // startWidth: 5,
                            // endWidth: 5,
                            color: Colors.blue,
                          ),
                          GaugeRange(
                            // label: "16-17%",
                            // labelStyle: GaugeTextStyle(fontSize: 8),
                            startValue: 16,
                            endValue: 17,
                            // startWidth: 5,
                            // endWidth: 5,
                            color: Colors.blue,
                          ),
                          GaugeRange(
                            startValue: 17,
                            endValue: 18,
                            // startWidth: 5,
                            // endWidth: 5,
                            color: Colors.blue,
                          ),
                          GaugeRange(
                            startValue: 16,
                            endValue: 26,
                            // startWidth: 40,
                            // endWidth: 40,
                            color: Colors.green,
                          ),
                          GaugeRange(
                            startValue: 26,
                            endValue: 30,
                            // startWidth: 40,
                            // endWidth: 40,
                            color: Colors.yellow,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 34,
                            // startWidth: 40,
                            // endWidth: 40,
                            color: Colors.orange,
                          ),
                          GaugeRange(
                            startValue: 34,
                            endValue: 40,
                            // startWidth: 40,
                            // endWidth: 40,
                            color: Colors.orange[700],
                          ),
                          GaugeRange(
                            startValue: 40,
                            endValue: 60,
                            // startWidth: 40,
                            // endWidth: 40,
                            color: Colors.red,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            enableAnimation: true,
                            enableDragging: true,
                            animationDuration: 3000,
                            needleLength: 0.5,
                            value: percentStatusValue == ""
                                ? 0.0
                                : double.parse(percentStatusValue),
                          ),
                        ],
                        // "${percentStatusValue + '%'}",
                        // annotations: <GaugeAnnotation>[
                        //   GaugeAnnotation(
                        //     widget: Container(
                        //       child: Text(
                        //         "${percentStatusValue + '%'}",
                        //         style: GoogleFonts.robotoSlab(
                        //           textStyle: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge,
                        //           fontSize: 26,
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.bold,
                        //           letterSpacing: 0.5,
                        //         ),
                        //       ),
                        //     ),
                        //     angle: 90,
                        //     positionFactor: 0.5,
                        //   ),
                        // ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: size,
              //   height: size,
              //   child: Container(
              //     child: SfRadialGauge(
              //       axes: <RadialAxis>[
              //         RadialAxis(
              //           minimum: 0,
              //           maximum: 80,
              //           labelOffset: 35,
              //           ranges: <GaugeRange>[
              //             GaugeRange(
              //               startValue: 0,
              //               endValue: 16,
              //               startWidth: 40,
              //               endWidth: 40,
              //               color: Colors.orangeAccent,
              //             ),
              //             GaugeRange(
              //               startValue: 16,
              //               endValue: 25,
              //               startWidth: 40,
              //               endWidth: 40,
              //               color: Colors.green,
              //             ),
              //             GaugeRange(
              //               startValue: 25,
              //               endValue: 60,
              //               startWidth: 40,
              //               endWidth: 40,
              //               color: Colors.orange,
              //             ),
              //             GaugeRange(
              //               startValue: 60,
              //               endValue: 80,
              //               startWidth: 40,
              //               endWidth: 40,
              //               color: Colors.red,
              //             ),
              //           ],
              // pointers: <GaugePointer>[
              //   NeedlePointer(
              //     enableAnimation: true,
              //     enableDragging: true,
              //     animationDuration: 3000,
              //     needleLength: 0.5,
              //     value: percentStatusValue == ""
              //         ? 0.0
              //         : double.parse(percentStatusValue),
              //   ),
              // ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //
              Row(
                children: [
                  Expanded(
                      child: CircleAvatar(
                          radius: 6, backgroundColor: Color(0xFF0954D4))),
                  Expanded(
                    child: Text(
                      "Very severely underweight",
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 12,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Expanded(child: Text("<16")),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                            radius: 6, backgroundColor: Colors.blueAccent)),
                    Expanded(
                      child: Text(
                        "Severely underweight",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("<16-16.9")),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                            radius: 6, backgroundColor: Colors.blue)),
                    Expanded(
                      child: Text(
                        "Underweight",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("<17-18.4")),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.green,
                    )),
                    Expanded(
                      child: Text(
                        "Normal",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("<16.5-26.6")),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.yellow,
                    )),
                    Expanded(
                      child: Text(
                        "Overweight",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("<26.6-60.6")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.orange,
                    )),
                    Expanded(
                      child: Text(
                        "Obese Class I",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("30.0-34.9")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.orange[800],
                    )),
                    Expanded(
                      child: Text(
                        "Obese Class II",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text("35.0-39.9")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                    )),
                    Expanded(
                      child: Text(
                        "Obese Class III",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Expanded(child: Text(">40.0")),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: Get.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color(0xFFA446A4),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Got it",
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        isDismissible: true,
        isScrollControlled: true);
  }
}
