import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyStepsPage extends StatefulWidget {
  @override
  _DailyStepsPageState createState() => _DailyStepsPageState();
}

class _DailyStepsPageState extends State<DailyStepsPage> {
  Box<int> stepsBox = Hive.box('steps');
  int todaySteps=0;
// this is without login
  @override
  void initState() {
    super.initState();
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI Steps',
                  style: GoogleFonts.robotoSlab(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "How many setps are in a Kilometer?",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Average walk: 1km = 1408 steps",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Brish walk: 1km = 1209 steps",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Jog 1km = 1219 steps",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Run 1 km = 1045 steps",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 40),
            Card(
              color: Colors.black87.withOpacity(0.7),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  children: <Widget>[
                    gradientShaderMask(
                      child: Text(
                        todaySteps?.toString() ?? '0',
                        style: GoogleFonts.darkerGrotesque(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text("Steps Today",
                        style: GoogleFonts.robotoSlab(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Pedestrian status:',
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),

            Lottie.asset(
              _status == 'walking'
                  ? "assets/lottie/walking-loading.json"
                  : "assets/lottie/question.json",
              height: 130,
              width: 130,
            ),

            // Icon(
            //   _status == 'walking'
            //       ? Icons.directions_walk
            //       : _status == 'stopped'
            //           ? Icons.accessibility_new
            //           : Icons.error,
            //   size: 100,
            //   color: Color(0xFFA446A4),
            // ),
            Center(
              child: Text(
                _status,
                style: _status == 'walking' || _status == 'stopped'
                    ? GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Color(0xff93b2fe),
                        letterSpacing: 0.5,
                      )
                    : GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Colors.red,
                        letterSpacing: 0.5,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gradientShaderMask({@required Widget? child}) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color(0xFF93B2FE),
          Color(0xFFAC7FFC),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Stream<StepCount>? _stepCountStream;
  Stream<PedestrianStatus>? _pedestrianStatusStream;
  String _status = '?';
  void startListening() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream!
        .listen(onPedestrianStatusChanged)
        .onError(_onPedestrianError);
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream!.listen(getTodaySteps).onError(_onError);
    if (mounted) return;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    if (mounted)
      setState(() {
        _status = event.status;
      });
  }

  void _onPedestrianError(error) =>
      Fluttertoast.showToast(msg: "Error is: $error");

  void _onDone() => print("Finished pedometer tracking");
  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int> getTodaySteps(StepCount value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int? savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    int todayDayNo = DateTime.now().day;
    if (value.steps < savedStepsCount!) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int? lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved! < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value.steps;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    if (mounted)
      setState(() {
        todaySteps = value.steps - savedStepsCount!;
      });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    // _subscription.cancel();
  }
}
