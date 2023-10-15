import 'dart:math';
import 'package:bmicalculator/screens/tipslooseweek.dart';
import 'package:bmicalculator/screens/tipsweek.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'btm_screen.dart';

class CalculateResult extends StatefulWidget {
  final double isInputweight;
  final isGender;
  final DateTime isDate;
  // ignore: non_constant_identifier_names
  final String Calculatetheresult, checkthemass, givesuggestions;

  CalculateResult({
    // ignore: non_constant_identifier_names
    required this.Calculatetheresult,
    required this.checkthemass,
    required this.givesuggestions,
    required this.isInputweight,
    required this.isGender,
    required this.isDate,
  });

  @override
  State<CalculateResult> createState() => _CalculateResultState();
}

class _CalculateResultState extends State<CalculateResult> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();

    _refreshItems();
    //
    addweightStatus(widget.checkthemass.toString());
    addpercentStatus(widget.Calculatetheresult);
    addgivesuggestionStatus(widget.givesuggestions);
    //
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenter.play();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  /// ////////////// geting values for histry ////////////////

  String weightStatusValue = '';

  addweightStatus(String dataValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValueForweightStatus', dataValue);
  }

  String percentStatusValue = '';

  addpercentStatus(String dataValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValueForPercentStatus', dataValue);
  }

  String givesuggestionStatusValue = '';

  addgivesuggestionStatus(String dataValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValueForgivesuggestionStatus', dataValue);
  }

  @override
  Widget build(BuildContext context) {
    print("widget.checkthemass: ${widget.checkthemass}");
    print("widget.perect: ${widget.Calculatetheresult}");
    print("widget.suggstion: ${widget.givesuggestions}");
    final size = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) -
        30;

    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg:
              "Can't back with mobile button, Use app buttons for back\nThanks!",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
        );
        // Disable the back button functionality
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Color(0xFFA446A4),
              borderRadius: BorderRadius.circular(80),
            ),
            child: TextButton(
              onPressed: () {
                print(
                    "date s: ${widget.isDate.toString().split('-').last.split(' ').first}");

                _createItem({
                  "name": "${widget.Calculatetheresult + '%'}",
                  "quantity": widget.checkthemass.toString(),
                  "date": widget.isDate,
                  "weight": widget.isInputweight,
                }).whenComplete(() {
                  Get.closeAllSnackbars();
                  Get.snackbar(
                    'Saved',
                    "Result is saved into your history",
                    backgroundColor: Colors.black12,
                    colorText: Colors.white,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarScreen(),
                    ),
                  );
                });
              },
              child: Text(
                "Save",
                style: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: TextButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text("Delect confirm"),
                  content: Text("Are you sure you want to delete this record?"),
                  actions: <Widget>[
                    // if (cancelActionText != null)
                    CupertinoDialogAction(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    CupertinoDialogAction(
                      child: Text("Delete"),
                      textStyle: TextStyle(color: Colors.red),
                      onPressed: () {
                        Get.back();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBarScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            child: Text(
              "Discard",
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: ConfettiWidget(
                                confettiController: _controllerCenter,
                                blastDirectionality:
                                    BlastDirectionality.explosive,
                                shouldLoop: false,
                                colors: const [
                                  Colors.green,
                                  Colors.blue,
                                  Colors.pink,
                                  Colors.orange,
                                  Colors.purple
                                ],
                                createParticlePath: drawStar,
                              ),
                            ),
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
                                          value: double.parse(
                                            widget.Calculatetheresult,
                                          ),
                                        ),
                                      ],
                                      // "${percentStatusValue + '%'}",
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          widget: Container(
                                            child: Text(
                                              widget.Calculatetheresult + '%',
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
                            widget.checkthemass == "Normal"
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
                                : widget.checkthemass == "Over Weight"
                                    ? Container(
                                        height: 60,
                                        width: Get.width * 0.6,
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
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
                                          borderRadius:
                                              BorderRadius.circular(14.0),
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
                                        radius: 6,
                                        backgroundColor: Colors.blue)),
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
                      SizedBox(height: 40),
                      // Expanded(
                      //   flex: 0,
                      //   child: Container(
                      //     height: 50,
                      //     width: MediaQuery.of(context).size.width * 0.9,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFFA446A4),
                      //       borderRadius: BorderRadius.circular(80),
                      //     ),
                      //     child: TextButton(
                      //       onPressed: () {
                      //         print(
                      //             "date s: ${widget.isDate.toString().split('-').last.split(' ').first}");

                      //         _createItem({
                      //           "name": "${widget.Calculatetheresult + '%'}",
                      //           "quantity": widget.checkthemass.toString(),
                      //           "date": widget.isDate,
                      //           "weight": widget.isInputweight,
                      //         }).whenComplete(() {
                      //           Get.closeAllSnackbars();
                      //           Get.snackbar(
                      //             'Saved',
                      //             "Result is saved into your history",
                      //             backgroundColor: Colors.black12,
                      //             colorText: Colors.white,
                      //           );
                      //           Navigator.pop(context);
                      //         });
                      //       },
                      //       child: Text(
                      //         "Save",
                      //         style: GoogleFonts.robotoSlab(
                      //           textStyle: Theme.of(context).textTheme.bodyLarge,
                      //           fontSize: 16,
                      //           color: Colors.white,
                      //           letterSpacing: 0.5,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _items = [];

  Box _shoppingBox = Hive.box('BMI_Activity');
  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Get all items from the database
  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "name": value["name"],
        "quantity": value['quantity'],
        "date": value['date'],
        "weight": value['weight'],
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print("_items: $_items");
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

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
                            value: double.parse(
                              widget.Calculatetheresult,
                            ),
                          ),
                        ],
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
              //     value: double.parse(
              //       widget.Calculatetheresult,
              //     ),
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
