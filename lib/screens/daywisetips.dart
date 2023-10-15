
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/sizbox.dart';

class Daywise extends StatefulWidget {
  Daywise({
    required this.day,
    required this.tip1,
    required this.tip2,
    required this.tip3,
    required this.exercise1,
    required this.exercise2,
    required this.exercise3,
  });
  final String tip1, tip2, tip3, exercise1, exercise2, exercise3;
  final int day;

  @override
  State<Daywise> createState() => _DaywiseState();
}

class _DaywiseState extends State<Daywise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 150,
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
                  "Day ${widget.day.toString()}",
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Text(
                      'Exercise',
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (widget.day == 1) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: dayexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: dayexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: dayexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV1 == null
                                        ? false
                                        : selectedLoseTypeV1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV1 = value!;
                                        addStringForV1(selectedLoseTypeV1);
                                        print(selectedLoseTypeV1);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 2) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day2exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day2exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day2exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV2 == null
                                        ? false
                                        : selectedLoseTypeV2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV2 = value!;
                                        addStringForV2(selectedLoseTypeV2);
                                        print(selectedLoseTypeV2);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 3) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day3exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day3exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day3exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV3 == null
                                        ? false
                                        : selectedLoseTypeV3,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV3 = value!;
                                        addStringForV3(selectedLoseTypeV3);
                                        print(selectedLoseTypeV3);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 4) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day4exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day4exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day4exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV4 == null
                                        ? false
                                        : selectedLoseTypeV4,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV4 = value!;
                                        addStringForV4(selectedLoseTypeV4);
                                        print(selectedLoseTypeV4);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 5) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day5exe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day5exe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day5exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV5 == null
                                        ? false
                                        : selectedLoseTypeV5,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV5 = value!;
                                        addStringForV5(selectedLoseTypeV5);
                                        print(selectedLoseTypeV5);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 6) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day6exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day6exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day6exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV6 == null
                                        ? false
                                        : selectedLoseTypeV6,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV6 = value!;
                                        addStringForV6(selectedLoseTypeV6);
                                        print(selectedLoseTypeV6);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 7) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day7exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day7exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day7exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV7 == null
                                        ? false
                                        : selectedLoseTypeV7,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV7 = value!;
                                        addStringForV7(selectedLoseTypeV7);
                                        print(selectedLoseTypeV7);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 8) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day8exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day8exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day8exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV8 == null
                                        ? false
                                        : selectedLoseTypeV8,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV8 = value!;
                                        addStringForV8(selectedLoseTypeV8);
                                        print(selectedLoseTypeV8);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 9) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day9exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day9exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day9exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV9 == null
                                        ? false
                                        : selectedLoseTypeV9,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV9 = value!;
                                        addStringForV9(selectedLoseTypeV9);
                                        print(selectedLoseTypeV9);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                            if (widget.day == 10) ...[
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day10exe1,
                              ),
                              Text(widget.exercise1,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day10exe2,
                              ),
                              Text(widget.exercise2,
                                  style: GoogleFonts.robotoSlab(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontSize: 14,
                                    color: Color(0xffac7ffc),
                                    letterSpacing: 0.0,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day10exe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Finished",
                                    style: GoogleFonts.robotoSlab(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 12,
                                      color: Colors.green,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: selectedLoseTypeV10 == null
                                        ? false
                                        : selectedLoseTypeV10,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedLoseTypeV10 = value!;
                                        addStringForV10(selectedLoseTypeV10);
                                        print(selectedLoseTypeV10);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'Breakfast',
                    style: GoogleFonts.robotoSlab(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if (widget.day == 1) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: daybf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB1 == null
                                          ? false
                                          : selectedLoseTypeVB1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedLoseTypeVB1 = value!;
                                          addStringForVB1(selectedLoseTypeVB1);
                                          print(selectedLoseTypeVB1);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 2) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day2bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB2 == null
                                          ? false
                                          : selectedLoseTypeVB2,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB2 = value!;
                                          addStringForVB2(selectedLoseTypeVB2);
                                          print(selectedLoseTypeVB2);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 3) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day3bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB3 == null
                                          ? false
                                          : selectedLoseTypeVB3,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB3 = value!;
                                          addStringForVB3(selectedLoseTypeVB3);
                                          print(selectedLoseTypeVB3);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 4) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day4bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB4 == null
                                          ? false
                                          : selectedLoseTypeVB4,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB4 = value!;
                                          addStringForVB4(selectedLoseTypeVB4);
                                          print(selectedLoseTypeVB4);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 5) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day5bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB5 == null
                                          ? false
                                          : selectedLoseTypeVB5,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB5 = value!;
                                          addStringForVB5(selectedLoseTypeVB5);
                                          print(selectedLoseTypeVB5);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 6) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day6bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB6 == null
                                          ? false
                                          : selectedLoseTypeVB6,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB6 = value!;
                                          addStringForVB6(selectedLoseTypeVB6);
                                          print(selectedLoseTypeVB6);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 7) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day7bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB7 == null
                                          ? false
                                          : selectedLoseTypeVB7,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB7 = value!;
                                          addStringForVB7(selectedLoseTypeVB7);
                                          print(selectedLoseTypeVB7);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 8) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day8bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB8 == null
                                          ? false
                                          : selectedLoseTypeVB8,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB8 = value!;
                                          addStringForVB8(selectedLoseTypeVB8);
                                          print(selectedLoseTypeVB8);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 9) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day9bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB9 == null
                                          ? false
                                          : selectedLoseTypeVB9,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB9 = value!;
                                          addStringForVB9(selectedLoseTypeVB9);
                                          print(selectedLoseTypeVB9);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 10) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day10bf,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVB10 == null
                                          ? false
                                          : selectedLoseTypeVB10,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVB10 = value!;
                                          addStringForVB10(
                                              selectedLoseTypeVB10);
                                          print(selectedLoseTypeVB10);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 20),
                              Text(
                                widget.tip1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      'Lunch',
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if (widget.day == 1) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: daylunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL1 == null
                                          ? false
                                          : selectedLoseTypeVL1,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL1 = value!;
                                          addStringForVL1(selectedLoseTypeVL1);
                                          print(selectedLoseTypeVL1);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 2) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day2lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL2 == null
                                          ? false
                                          : selectedLoseTypeVL2,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL2 = value!;
                                          addStringForVL2(selectedLoseTypeVL2);
                                          print(selectedLoseTypeVL2);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 3) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day3lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL3 == null
                                          ? false
                                          : selectedLoseTypeVL3,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL3 = value!;
                                          addStringForVL3(selectedLoseTypeVL3);
                                          print(selectedLoseTypeVL3);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 4) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day4lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL4 == null
                                          ? false
                                          : selectedLoseTypeVL4,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL4 = value!;
                                          addStringForVL4(selectedLoseTypeVL4);
                                          print(selectedLoseTypeVL4);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 5) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day5lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL5 == null
                                          ? false
                                          : selectedLoseTypeVL5,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL5 = value!;
                                          addStringForVL5(selectedLoseTypeVL5);
                                          print(selectedLoseTypeVL5);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 6) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day6lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL6 == null
                                          ? false
                                          : selectedLoseTypeVL6,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL6 = value!;
                                          addStringForVL6(selectedLoseTypeVL6);
                                          print(selectedLoseTypeVL6);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 7) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day7lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL7 == null
                                          ? false
                                          : selectedLoseTypeVL7,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL7 = value!;
                                          addStringForVL7(selectedLoseTypeVL7);
                                          print(selectedLoseTypeVL7);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 8) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day8lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL8 == null
                                          ? false
                                          : selectedLoseTypeVL8,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL8 = value!;
                                          addStringForVL8(selectedLoseTypeVL8);
                                          print(selectedLoseTypeVL8);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 9) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day9lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL9 == null
                                          ? false
                                          : selectedLoseTypeVL9,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVL9 = value!;
                                          addStringForVL9(selectedLoseTypeVL9);
                                          print(selectedLoseTypeVL9);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 10) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day10lunch,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVL10 == null
                                          ? false
                                          : selectedLoseTypeVL10,
                                      onChanged: ( value) {
                                        setState(() {
                                          selectedLoseTypeVL10 = value!;
                                          addStringForVL10(
                                              selectedLoseTypeVL10);
                                          print(selectedLoseTypeVL10);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 20),
                              Text(
                                widget.tip2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Text(
                      'Dinner',
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if (widget.day == 1) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: daydinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD1 == null
                                          ? false
                                          : selectedLoseTypeVD1,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD1 = value!;
                                          addStringForVD1(selectedLoseTypeVD1);
                                          print(selectedLoseTypeVD1);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 2) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day2dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD2 == null
                                          ? false
                                          : selectedLoseTypeVD2,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD2 = value!;
                                          addStringForVD2(selectedLoseTypeVD2);
                                          print(selectedLoseTypeVD2);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 3) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day3dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD3 == null
                                          ? false
                                          : selectedLoseTypeVD3,
                                      onChanged: ( value) {
                                        setState(() {
                                          selectedLoseTypeVD3 = value!;
                                          addStringForVD3(selectedLoseTypeVD3);
                                          print(selectedLoseTypeVD3);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 4) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day4dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD4 == null
                                          ? false
                                          : selectedLoseTypeVD4,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD4 = value!;
                                          addStringForVD4(selectedLoseTypeVD4);
                                          print(selectedLoseTypeVD4);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 5) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day5dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD5 == null
                                          ? false
                                          : selectedLoseTypeVD5,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD5 = value!;
                                          addStringForVD5(selectedLoseTypeVD5);
                                          print(selectedLoseTypeVD5);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 6) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day6dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD6 == null
                                          ? false
                                          : selectedLoseTypeVD6,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD6 = value!;
                                          addStringForVD6(selectedLoseTypeVD6);
                                          print(selectedLoseTypeVD6);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 7) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day7dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD7 == null
                                          ? false
                                          : selectedLoseTypeVD7,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD7 = value!;
                                          addStringForVD7(selectedLoseTypeVD7);
                                          print(selectedLoseTypeVD7);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 8) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day8dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD8 == null
                                          ? false
                                          : selectedLoseTypeVD8,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD8 = value!;
                                          addStringForVD8(selectedLoseTypeVD8);
                                          print(selectedLoseTypeVD8);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 9) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day9dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD9 == null
                                          ? false
                                          : selectedLoseTypeVD9,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD9 = value!;
                                          addStringForVD9(selectedLoseTypeVD9);
                                          print(selectedLoseTypeVD9);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              if (widget.day == 10) ...[
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: day10dinner,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Finished",
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontSize: 12,
                                        color: Colors.green,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: selectedLoseTypeVD10 == null
                                          ? false
                                          : selectedLoseTypeVD10,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLoseTypeVD10 = value!;
                                          addStringForVD10(
                                              selectedLoseTypeVD10);
                                          print(selectedLoseTypeVD10);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 20),
                              Text(
                                widget.tip3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 14,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //.................................................................///
  bool selectedLoseTypeV1=false;

  addStringForV1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV1', anguageDataVale);
  }

  getStringForV1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV1 = prefs.getBool('stringValueLoseForV1') ?? false;
    });
    print("selectedLoseTypeV1 : $selectedLoseTypeV1");
    return selectedLoseTypeV1;
  }

  // 2
  bool selectedLoseTypeV2=false;

  addStringForV2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV2', anguageDataVale);
  }

  getStringForV2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV2 = prefs.getBool('stringValueLoseForV2') ?? false;
    });
    print("selectedLoseTypeV2 : $selectedLoseTypeV2");
    return selectedLoseTypeV2;
  }

  // 3
  bool selectedLoseTypeV3=false;

  addStringForV3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV3', anguageDataVale);
  }

  getStringForV3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV3 = prefs.getBool('stringValueLoseForV3') ?? false;
    });
    print("selectedLoseTypeV3 : $selectedLoseTypeV3");
    return selectedLoseTypeV3;
  }

  // 4
  bool selectedLoseTypeV4=false;

  addStringForV4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV4', anguageDataVale);
  }

  getStringForV4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV4 = prefs.getBool('stringValueLoseForV4') ?? false;
    });
    print("selectedLoseTypeV4 : $selectedLoseTypeV4");
    return selectedLoseTypeV4;
  }

  // 5
  bool selectedLoseTypeV5=false;

  addStringForV5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV5', anguageDataVale);
  }

  getStringForV5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV5 = prefs.getBool('stringValueLoseForV5') ?? false;
    });
    print("selectedLoseTypeV5 : $selectedLoseTypeV5");
    return selectedLoseTypeV5;
  }

  // 6
  bool selectedLoseTypeV6=false;

  addStringForV6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV6', anguageDataVale);
  }

  getStringForV6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV6 = prefs.getBool('stringValueLoseForV6') ?? false;
    });
    print("selectedLoseTypeV6 : $selectedLoseTypeV6");
    return selectedLoseTypeV6;
  }

  // 7
  bool selectedLoseTypeV7=false;

  addStringForV7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV7', anguageDataVale);
  }

  getStringForV7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV7 = prefs.getBool('stringValueLoseForV7') ?? false;
    });
    print("selectedLoseTypeV7 : $selectedLoseTypeV7");
    return selectedLoseTypeV7;
  }

  // 8
  bool selectedLoseTypeV8=false;

  addStringForV8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV8', anguageDataVale);
  }

  getStringForV8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV8 = prefs.getBool('stringValueLoseForV8') ?? false;
    });
    print("selectedLoseTypeV8 : $selectedLoseTypeV8");
    return selectedLoseTypeV8;
  }

  // 9
  bool selectedLoseTypeV9=false;

  addStringForV9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV9', anguageDataVale);
  }

  getStringForV9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV9 = prefs.getBool('stringValueLoseForV9') ?? false;
    });
    print("selectedTypeV9 : $selectedLoseTypeV9");
    return selectedLoseTypeV9;
  }

  // 10
  bool selectedLoseTypeV10=false;

  addStringForV10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForV10', anguageDataVale);
  }

  getStringForV10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeV10 = prefs.getBool('stringValueLoseForV10') ?? false;
    });
    print("selectedLoseTypeV10 : $selectedLoseTypeV10");
    return selectedLoseTypeV10;
  }

  // ....................... for break fast ..............................//
  bool selectedLoseTypeVB1=false;

  addStringForVB1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB1', anguageDataVale);
  }

  getStringForVB1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB1 = prefs.getBool('stringValueLoseForVB1') ?? false;
    });
    print("selectedLoseTypeVB1 : $selectedLoseTypeVB1");
    return selectedLoseTypeVB1;
  }

  // 2
  bool selectedLoseTypeVB2=false;

  addStringForVB2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB2', anguageDataVale);
  }

  getStringForVB2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB2 = prefs.getBool('stringValueLoseForVB2') ?? false;
    });
    print("selectedLoseTypeVB2 : $selectedLoseTypeVB2");
    return selectedLoseTypeVB2;
  }

  // 3
  bool selectedLoseTypeVB3=false;

  addStringForVB3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB3', anguageDataVale);
  }

  getStringForVB3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB3 = prefs.getBool('stringValueLoseForVB3') ?? false;
    });
    print("selectedLoseTypeVB3 : $selectedLoseTypeVB3");
    return selectedLoseTypeVB3;
  }

  // 4
  bool selectedLoseTypeVB4=false;

  addStringForVB4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB4', anguageDataVale);
  }

  getStringForVB4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB4 = prefs.getBool('stringValueLoseForVB4') ?? false;
    });
    print("selectedLoseTypeVB4 : $selectedLoseTypeVB4");
    return selectedLoseTypeVB4;
  }

  // 5
  bool selectedLoseTypeVB5=false;

  addStringForVB5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB5', anguageDataVale);
  }

  getStringForVB5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB5 = prefs.getBool('stringValueLoseForVB5') ?? false;
    });
    print("selectedLoseTypeVB5 : $selectedLoseTypeVB5");
    return selectedLoseTypeVB5;
  }

  // 6
  bool selectedLoseTypeVB6=false;

  addStringForVB6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB6', anguageDataVale);
  }

  getStringForVB6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB6 = prefs.getBool('stringValueLoseForVB6') ?? false;
    });
    print("selectedLoseTypeVB6 : $selectedLoseTypeVB6");
    return selectedLoseTypeVB6;
  }

  // 7
  bool selectedLoseTypeVB7=false;

  addStringForVB7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB7', anguageDataVale);
  }

  getStringForVB7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB7 = prefs.getBool('stringValueLoseForVB7') ?? false;
    });
    print("selectedLoseTypeVB7 : $selectedLoseTypeVB7");
    return selectedLoseTypeVB7;
  }

  // 8
  bool selectedLoseTypeVB8=false;

  addStringForVB8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB8', anguageDataVale);
  }

  getStringForVB8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB8 = prefs.getBool('stringValueLoseForVB8') ?? false;
    });
    print("selectedLoseTypeVB8 : $selectedLoseTypeVB8");
    return selectedLoseTypeVB8;
  }

  // 9
  bool selectedLoseTypeVB9=false;

  addStringForVB9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB9', anguageDataVale);
  }

  getStringForVB9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB9 = prefs.getBool('stringValueLoseForVB9') ?? false;
    });
    print("selectedLoseTypeVB9 : $selectedLoseTypeVB9");
    return selectedLoseTypeVB9;
  }

  // 10
  bool selectedLoseTypeVB10=false;

  addStringForVB10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVB10', anguageDataVale);
  }

  getStringForVB10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVB10 = prefs.getBool('stringValueLoseForVB10') ?? false;
    });
    print("selectedLoseTypeVB10 : $selectedLoseTypeVB10");
    return selectedLoseTypeVB10;
  }

  // ........................................lunch ............... //////////////
  bool selectedLoseTypeVL1=false;

  addStringForVL1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL1', anguageDataVale);
  }

  getStringForVL1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL1 = prefs.getBool('stringValueLoseForVL1') ?? false;
    });
    print("selectedLoseTypeVL1 : $selectedLoseTypeVL1");
    return selectedLoseTypeVL1;
  }

  // 2
  bool selectedLoseTypeVL2=false;

  addStringForVL2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL2', anguageDataVale);
  }

  getStringForVL2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL2 = prefs.getBool('stringValueLoseForVL2') ?? false;
    });
    print("selectedLoseTypeVL2 : $selectedLoseTypeVL2");
    return selectedLoseTypeVL2;
  }

  // 3
  bool selectedLoseTypeVL3=false;

  addStringForVL3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL3', anguageDataVale);
  }

  getStringForVL3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL3 = prefs.getBool('stringValueLoseForVL3') ?? false;
    });
    print("selectedLoseTypeVL3 : $selectedLoseTypeVL3");
    return selectedLoseTypeVL3;
  }

  // 4
  bool selectedLoseTypeVL4=false;

  addStringForVL4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL4', anguageDataVale);
  }

  getStringForVL4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL4 = prefs.getBool('stringValueLoseForVL4') ?? false;
    });
    print("selectedLoseTypeVL4 : $selectedLoseTypeVL4");
    return selectedLoseTypeVL4;
  }

  // 5
  bool selectedLoseTypeVL5=false;

  addStringForVL5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL5', anguageDataVale);
  }

  getStringForVL5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL5 = prefs.getBool('stringValueLoseForVL5') ?? false;
    });
    print("selectedLoseTypeVL5 : $selectedLoseTypeVL5");
    return selectedLoseTypeVL5;
  }

  // 6
  bool selectedLoseTypeVL6=false;

  addStringForVL6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL6', anguageDataVale);
  }

  getStringForVL6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL6 = prefs.getBool('stringValueLoseForVL6') ?? false;
    });
    print("selectedLoseTypeVL6 : $selectedLoseTypeVL6");
    return selectedLoseTypeVL6;
  }

  // 7
  bool selectedLoseTypeVL7=false;

  addStringForVL7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL7', anguageDataVale);
  }

  getStringForVL7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL7 = prefs.getBool('stringValueLoseForVL7') ?? false;
    });
    print("selectedLoseTypeVL7 : $selectedLoseTypeVL7");
    return selectedLoseTypeVL7;
  }

  // 8
  bool selectedLoseTypeVL8=false;

  addStringForVL8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL8', anguageDataVale);
  }

  getStringForVL8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL8 = prefs.getBool('stringValueLoseForVL8') ?? false;
    });
    print("selectedLoseTypeVL8 : $selectedLoseTypeVL8");
    return selectedLoseTypeVL8;
  }

  // 9
  bool selectedLoseTypeVL9=false;

  addStringForVL9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL9', anguageDataVale);
  }

  getStringForVL9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL9 = prefs.getBool('stringValueLoseForVL9') ?? false;
    });
    print("selectedLoseTypeVL9 : $selectedLoseTypeVL9");
    return selectedLoseTypeVL9;
  }

  // 10
  bool selectedLoseTypeVL10=false;

  addStringForVL10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVL10', anguageDataVale);
  }

  getStringForVL10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVL10 = prefs.getBool('stringValueLoseForVL10') ?? false;
    });
    print("selectedLoseTypeVL10 : $selectedLoseTypeVL10");
    return selectedLoseTypeVL10;
  }

  // ..............................dinner .............................///////
  bool selectedLoseTypeVD1=false;

  addStringForVD1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD1', anguageDataVale);
  }

  getStringForVD1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD1 = prefs.getBool('stringValueLoseForVD1') ?? false;
    });
    print("selectedLoseTypeVD1 : $selectedLoseTypeVD1");
    return selectedLoseTypeVD1;
  }

  // 2
  bool selectedLoseTypeVD2=false;

  addStringForVD2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD2', anguageDataVale);
  }

  getStringForVD2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD2 = prefs.getBool('stringValueLoseForVD2') ?? false;
    });
    print("selectedLoseTypeVD2 : $selectedLoseTypeVD2");
    return selectedLoseTypeVD2;
  }

  // 3
  bool selectedLoseTypeVD3=false;

  addStringForVD3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD3', anguageDataVale);
  }

  getStringForVD3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD3 = prefs.getBool('stringValueLoseForVD3') ?? false;
    });
    print("selectedLoseTypeVD3 : $selectedLoseTypeVD3");
    return selectedLoseTypeVD3;
  }

  // 4
  bool selectedLoseTypeVD4=false;

  addStringForVD4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD4', anguageDataVale);
  }

  getStringForVD4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD4 = prefs.getBool('stringValueLoseForVD4') ?? false;
    });
    print("selectedLoseTypeVD4 : $selectedLoseTypeVD4");
    return selectedLoseTypeVD4;
  }

  // 5
  bool selectedLoseTypeVD5=false;

  addStringForVD5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD5', anguageDataVale);
  }

  getStringForVD5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD5 = prefs.getBool('stringValueLoseForVD5') ?? false;
    });
    print("selectedLoseTypeVD5 : $selectedLoseTypeVD5");
    return selectedLoseTypeVD5;
  }

  // 6
  bool selectedLoseTypeVD6=false;

  addStringForVD6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD6', anguageDataVale);
  }

  getStringForVD6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD6 = prefs.getBool('stringValueLoseForVD6') ?? false;
    });
    print("selectedLoseTypeVD6 : $selectedLoseTypeVD6");
    return selectedLoseTypeVD6;
  }

  // 7
  bool selectedLoseTypeVD7=false;

  addStringForVD7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD7', anguageDataVale);
  }

  getStringForVD7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD7 = prefs.getBool('stringValueLoseForVD7') ?? false;
    });
    print("selectedLoseTypeVD7 : $selectedLoseTypeVD7");
    return selectedLoseTypeVD7;
  }

  // 8
  bool selectedLoseTypeVD8=false;

  addStringForVD8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD8', anguageDataVale);
  }

  getStringForVD8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD8 = prefs.getBool('stringValueLoseForVD8') ?? false;
    });
    print("selectedLoseTypeVD8 : $selectedLoseTypeVD8");
    return selectedLoseTypeVD8;
  }

  // 9
  bool selectedLoseTypeVD9=false;

  addStringForVD9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD9', anguageDataVale);
  }

  getStringForVD9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD9 = prefs.getBool('stringValueLoseForVD9') ?? false;
    });
    print("selectedLoseTypeVD9 : $selectedLoseTypeVD9");
    return selectedLoseTypeVD9;
  }

  // 10
  bool selectedLoseTypeVD10=false;

  addStringForVD10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueLoseForVD10', anguageDataVale);
  }

  getStringForVD10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLoseTypeVD10 = prefs.getBool('stringValueLoseForVD10') ?? false;
    });
    print("selectedLoseTypeVD10 : $selectedLoseTypeVD10");
    return selectedLoseTypeVD10;
  }

  @override
  void initState() {
    super.initState();
    //nashta
    getStringForV1();
    getStringForV2();
    getStringForV3();
    getStringForV4();
    getStringForV5();
    getStringForV6();
    getStringForV7();
    getStringForV8();
    getStringForV9();
    getStringForV10();
    //V Breakfask
    getStringForVB1();
    getStringForVB2();
    getStringForVB3();
    getStringForVB4();
    getStringForVB5();
    getStringForVB6();
    getStringForVB7();
    getStringForVB8();
    getStringForVB9();
    getStringForVB10();
    //lunch
    getStringForVL1();
    getStringForVL2();
    getStringForVL3();
    getStringForVL4();
    getStringForVL5();
    getStringForVL6();
    getStringForVL7();
    getStringForVL8();
    getStringForVL9();
    getStringForVL10();
    //dinner
    getStringForVD1();
    getStringForVD2();
    getStringForVD3();
    getStringForVD4();
    getStringForVD5();
    getStringForVD6();
    getStringForVD7();
    getStringForVD8();
    getStringForVD9();
    getStringForVD10();
  }
}
