
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/sizbox.dart';

class Daygainwise extends StatefulWidget {
  Daygainwise({
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
  State<Daygainwise> createState() => _DaygainwiseState();
}

class _DaygainwiseState extends State<Daygainwise> {
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
                  ),
                ),
                Expanded(
                  flex: 7,
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
                                child: day1gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day1gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day1gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV1 == null
                                        ? false
                                        : selectedTypeV1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV1 = value!;
                                        addStringForV1(selectedTypeV1!);
                                        print(selectedTypeV1);
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
                                child: day2gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day2gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day2gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV2 == null
                                        ? false
                                        : selectedTypeV2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV2 = value!;
                                        addStringForV2(selectedTypeV2!);
                                        print(selectedTypeV2);
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
                                child: day3gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day3gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day3gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV3 == null
                                        ? false
                                        : selectedTypeV3,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV3 = value!;
                                        addStringForV3(selectedTypeV3);
                                        print(selectedTypeV3);
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
                                child: day4gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day4gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day4gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV4 == null
                                        ? false
                                        : selectedTypeV4,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV4 = value!;
                                        addStringForV4(selectedTypeV4);
                                        print(selectedTypeV4);
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
                                child: day5gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day5gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day5gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV5 == null
                                        ? false
                                        : selectedTypeV5,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV5 = value!;
                                        addStringForV5(selectedTypeV5);
                                        print(selectedTypeV5);
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
                                child: day6gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day6gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day6gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV6 == null
                                        ? false
                                        : selectedTypeV6,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV6 = value!;
                                        addStringForV6(selectedTypeV6);
                                        print(selectedTypeV6);
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
                                child: day7gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day7gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day7gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV7 == null
                                        ? false
                                        : selectedTypeV7,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV7 = value!;
                                        addStringForV7(selectedTypeV7);
                                        print(selectedTypeV7);
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
                                child: day8gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day8gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day8gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV8 == null
                                        ? false
                                        : selectedTypeV8,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV8 = value!;
                                        addStringForV8(selectedTypeV8);
                                        print(selectedTypeV8);
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
                                child: day9gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day9gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day9gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV9 == null
                                        ? false
                                        : selectedTypeV9,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV9 = value!;
                                        addStringForV9(selectedTypeV9);
                                        print(selectedTypeV9);
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
                                child: day10gainexe1,
                              ),
                              Text(
                                widget.exercise1,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day10gainexe2,
                              ),
                              Text(
                                widget.exercise2,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
                                  color: Color(0xffac7ffc),
                                  letterSpacing: 0.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: day10gainexe3,
                              ),
                              Text(
                                widget.exercise3,
                                style: GoogleFonts.robotoSlab(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 18,
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
                                    value: selectedTypeV10 == null
                                        ? false
                                        : selectedTypeV10,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedTypeV10 = value!;
                                        addStringForV10(selectedTypeV10);
                                        print(selectedTypeV10);
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
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                                  child: day1gainbf,
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
                                      value: selectedTypeVB1 == null
                                          ? false
                                          : selectedTypeVB1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB1 = value!;
                                          addStringForVB1(selectedTypeVB1);
                                          print(selectedTypeVB1);
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
                                  child: day2gainbf,
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
                                      value: selectedTypeVB2 == null
                                          ? false
                                          : selectedTypeVB2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB2 = value!;
                                          addStringForVB2(selectedTypeVB2);
                                          print(selectedTypeVB2);
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
                                  child: day3gainbf,
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
                                      value: selectedTypeVB3 == null
                                          ? false
                                          : selectedTypeVB3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB3 = value!;
                                          addStringForVB3(selectedTypeVB3);
                                          print(selectedTypeVB3);
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
                                  child: day4gainbf,
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
                                      value: selectedTypeVB4 == null
                                          ? false
                                          : selectedTypeVB4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB4 = value!;
                                          addStringForVB4(selectedTypeVB4);
                                          print(selectedTypeVB4);
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
                                  child: day5gainbf,
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
                                      value: selectedTypeVB5 == null
                                          ? false
                                          : selectedTypeVB5,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB5 = value!;
                                          addStringForVB5(selectedTypeVB5);
                                          print(selectedTypeVB5);
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
                                  child: day6gainbf,
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
                                      value: selectedTypeVB6 == null
                                          ? false
                                          : selectedTypeVB6,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB6 = value!;
                                          addStringForVB6(selectedTypeVB6);
                                          print(selectedTypeVB6);
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
                                  child: day7gainbf,
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
                                      value: selectedTypeVB7 == null
                                          ? false
                                          : selectedTypeVB7,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB7 = value!;
                                          addStringForVB7(selectedTypeVB7);
                                          print(selectedTypeVB7);
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
                                  child: day8gainbf,
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
                                      value: selectedTypeVB8 == null
                                          ? false
                                          : selectedTypeVB8,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB8 = value!;
                                          addStringForVB8(selectedTypeVB8);
                                          print(selectedTypeVB8);
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
                                  child: day9gainbf,
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
                                      value: selectedTypeVB9 == null
                                          ? false
                                          : selectedTypeVB9,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB9 = value!;
                                          addStringForVB9(selectedTypeVB9);
                                          print(selectedTypeVB9);
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
                                  child: day10gainbf,
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
                                      value: selectedTypeVB10 == null
                                          ? false
                                          : selectedTypeVB10,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVB10 = value!;
                                          addStringForVB10(selectedTypeVB10);
                                          print(selectedTypeVB10);
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
                                  fontSize: 18,
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
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    'Lunch',
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
                                  child: day1gainlunch,
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
                                      value: selectedTypeVL1 == null
                                          ? false
                                          : selectedTypeVL1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL1 = value!;
                                          addStringForVL1(selectedTypeVL1);
                                          print(selectedTypeVL1);
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
                                  child: day2gainlunch,
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
                                      value: selectedTypeVL2 == null
                                          ? false
                                          : selectedTypeVL2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL2 = value!;
                                          addStringForVL2(selectedTypeVL2);
                                          print(selectedTypeVL2);
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
                                  child: day3gainlunch,
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
                                      value: selectedTypeVL3 == null
                                          ? false
                                          : selectedTypeVL3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL3 = value!;
                                          addStringForVL3(selectedTypeVL3);
                                          print(selectedTypeVL3);
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
                                  child: day4gainlunch,
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
                                      value: selectedTypeVL4 == null
                                          ? false
                                          : selectedTypeVL4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL4 = value!;
                                          addStringForVL4(selectedTypeVL4);
                                          print(selectedTypeVL4);
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
                                  child: day5gainlunch,
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
                                      value: selectedTypeVL5 == null
                                          ? false
                                          : selectedTypeVL5,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL5 = value!;
                                          addStringForVL5(selectedTypeVL5);
                                          print(selectedTypeVL5);
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
                                  child: day6gainlunch,
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
                                      value: selectedTypeVL6 == null
                                          ? false
                                          : selectedTypeVL6,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL6 = value!;
                                          addStringForVL6(selectedTypeVL6);
                                          print(selectedTypeVL6);
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
                                  child: day7gainlunch,
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
                                      value: selectedTypeVL7 == null
                                          ? false
                                          : selectedTypeVL7,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL7 = value!;
                                          addStringForVL7(selectedTypeVL7);
                                          print(selectedTypeVL7);
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
                                  child: day8gainlunch,
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
                                      value: selectedTypeVL8 == null
                                          ? false
                                          : selectedTypeVL8,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL8 = value!;
                                          addStringForVL8(selectedTypeVL8);
                                          print(selectedTypeVL8);
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
                                  child: day9gainlunch,
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
                                      value: selectedTypeVL9 == null
                                          ? false
                                          : selectedTypeVL9,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL9 = value!;
                                          addStringForVL9(selectedTypeVL9);
                                          print(selectedTypeVL9);
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
                                  child: day10gainlunch,
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
                                      value: selectedTypeVL10 == null
                                          ? false
                                          : selectedTypeVL10,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVL10 = value!;
                                          addStringForVL10(selectedTypeVL10);
                                          print(selectedTypeVL10);
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
                                  fontSize: 18,
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
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    'Dinner',
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
                                  child: day1gaindinner,
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
                                      value: selectedTypeVD1 == null
                                          ? false
                                          : selectedTypeVD1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD1 = value!;
                                          addStringForVD1(selectedTypeVD1);
                                          print(selectedTypeVD1);
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
                                  child: day2gaindinner,
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
                                      value: selectedTypeVD2 == null
                                          ? false
                                          : selectedTypeVD2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD2 = value!;
                                          addStringForVD2(selectedTypeVD2);
                                          print(selectedTypeVD2);
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
                                  child: day3gaindinner,
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
                                      value: selectedTypeVD3 == null
                                          ? false
                                          : selectedTypeVD3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD3 = value!;
                                          addStringForVD3(selectedTypeVD3);
                                          print(selectedTypeVD3);
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
                                  child: day4gaindinner,
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
                                      value: selectedTypeVD4 == null
                                          ? false
                                          : selectedTypeVD4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD4 = value!;
                                          addStringForVD4(selectedTypeVD4);
                                          print(selectedTypeVD4);
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
                                  child: day5gaindinner,
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
                                      value: selectedTypeVD5 == null
                                          ? false
                                          : selectedTypeVD5,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD5 = value!;
                                          addStringForVD5(selectedTypeVD5);
                                          print(selectedTypeVD5);
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
                                  child: day6gaindinner,
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
                                      value: selectedTypeVD6 == null
                                          ? false
                                          : selectedTypeVD6,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD6 = value!;
                                          addStringForVD6(selectedTypeVD6);
                                          print(selectedTypeVD6);
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
                                  child: day7gaindinner,
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
                                      value: selectedTypeVD7 == null
                                          ? false
                                          : selectedTypeVD7,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD7 = value!;
                                          addStringForVD7(selectedTypeVD7);
                                          print(selectedTypeVD7);
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
                                  child: day8gaindinner,
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
                                      value: selectedTypeVD8 == null
                                          ? false
                                          : selectedTypeVD8,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD8 = value!;
                                          addStringForVD8(selectedTypeVD8);
                                          print(selectedTypeVD8);
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
                                  child: day9gaindinner,
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
                                      value: selectedTypeVD9 == null
                                          ? false
                                          : selectedTypeVD9,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD9 = value!;
                                          addStringForVD9(selectedTypeVD9);
                                          print(selectedTypeVD9);
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
                                  child: day10gaindinner,
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
                                      value: selectedTypeVD10 == null
                                          ? false
                                          : selectedTypeVD10,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          selectedTypeVD10 = value!;
                                          addStringForVD10(selectedTypeVD10);
                                          print(selectedTypeVD10);
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
                                  fontSize: 18,
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
  bool? selectedTypeV1;

  addStringForV1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV1', anguageDataVale);
  }

  getStringForV1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV1 = prefs.getBool('stringValueForV1') ?? false;
    });
    print("selectedTypeV1 : $selectedTypeV1");
    return selectedTypeV1;
  }

  // 2
  bool? selectedTypeV2;

  addStringForV2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV2', anguageDataVale);
  }

  getStringForV2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV2 = prefs.getBool('stringValueForV2') ?? false;
    });
    print("selectedTypeV2 : $selectedTypeV2");
    return selectedTypeV2;
  }

  // 3
  bool selectedTypeV3=false;

  addStringForV3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV3', anguageDataVale);
  }

  getStringForV3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV3 = prefs.getBool('stringValueForV3') ?? false;
    });
    print("selectedTypeV3 : $selectedTypeV3");
    return selectedTypeV3;
  }

  // 4
  bool selectedTypeV4=false;

  addStringForV4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV4', anguageDataVale);
  }

  getStringForV4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV4 = prefs.getBool('stringValueForV4') ?? false;
    });
    print("selectedTypeV4 : $selectedTypeV4");
    return selectedTypeV4;
  }

  // 5
  bool selectedTypeV5=false;

  addStringForV5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV5', anguageDataVale);
  }

  getStringForV5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV5 = prefs.getBool('stringValueForV5') ?? false;
    });
    print("selectedTypeV5 : $selectedTypeV5");
    return selectedTypeV5;
  }

  // 6
  bool selectedTypeV6=false;

  addStringForV6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV6', anguageDataVale);
  }

  getStringForV6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV6 = prefs.getBool('stringValueForV6') ?? false;
    });
    print("selectedTypeV6 : $selectedTypeV6");
    return selectedTypeV6;
  }

  // 7
  bool selectedTypeV7=false;

  addStringForV7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV7', anguageDataVale);
  }

  getStringForV7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV7 = prefs.getBool('stringValueForV7') ?? false;
    });
    print("selectedTypeV7 : $selectedTypeV7");
    return selectedTypeV7;
  }

  // 8
  bool selectedTypeV8=false;

  addStringForV8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV8', anguageDataVale);
  }

  getStringForV8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV8 = prefs.getBool('stringValueForV8') ?? false;
    });
    print("selectedTypeV8 : $selectedTypeV8");
    return selectedTypeV8;
  }

  // 9
  bool selectedTypeV9=false;

  addStringForV9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV9', anguageDataVale);
  }

  getStringForV9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV9 = prefs.getBool('stringValueForV9') ?? false;
    });
    print("selectedTypeV9 : $selectedTypeV9");
    return selectedTypeV9;
  }

  // 10
  bool selectedTypeV10=false;

  addStringForV10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForV10', anguageDataVale);
  }

  getStringForV10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeV10 = prefs.getBool('stringValueForV10') ?? false;
    });
    print("selectedTypeV10 : $selectedTypeV10");
    return selectedTypeV10;
  }

  // ....................... for break fast ..............................//

  // 1
  bool selectedTypeVB1=false;

  addStringForVB1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB1', anguageDataVale);
  }

  getStringForVB1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB1 = prefs.getBool('stringValueForVB1') ?? false;
    });
    print("selectedTypeVB1 : $selectedTypeVB1");
    return selectedTypeVB1;
  }

  // 2
  bool selectedTypeVB2=false;

  addStringForVB2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB2', anguageDataVale);
  }

  getStringForVB2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB2 = prefs.getBool('stringValueForVB2') ?? false;
    });
    print("selectedTypeVB2 : $selectedTypeVB2");
    return selectedTypeVB2;
  }

  // 3
  bool selectedTypeVB3=false;

  addStringForVB3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB3', anguageDataVale);
  }

  getStringForVB3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB3 = prefs.getBool('stringValueForVB3') ?? false;
    });
    print("selectedTypeVB3 : $selectedTypeVB3");
    return selectedTypeVB3;
  }

  // 4
  bool selectedTypeVB4=false;

  addStringForVB4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB4', anguageDataVale);
  }

  getStringForVB4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB4 = prefs.getBool('stringValueForVB4') ?? false;
    });
    print("selectedTypeVB4 : $selectedTypeVB4");
    return selectedTypeVB4;
  }

  // 5
  bool selectedTypeVB5=false;

  addStringForVB5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB5', anguageDataVale);
  }

  getStringForVB5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB5 = prefs.getBool('stringValueForVB5') ?? false;
    });
    print("selectedTypeVB5 : $selectedTypeVB5");
    return selectedTypeVB5;
  }

  // 6
  bool selectedTypeVB6=false;

  addStringForVB6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB6', anguageDataVale);
  }

  getStringForVB6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB6 = prefs.getBool('stringValueForVB6') ?? false;
    });
    print("selectedTypeVB6 : $selectedTypeVB6");
    return selectedTypeVB6;
  }

  // 7
  bool selectedTypeVB7=false;

  addStringForVB7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB7', anguageDataVale);
  }

  getStringForVB7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB7 = prefs.getBool('stringValueForVB7') ?? false;
    });
    print("selectedTypeVB7 : $selectedTypeVB7");
    return selectedTypeVB7;
  }

  // 8
  bool selectedTypeVB8=false;

  addStringForVB8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB8', anguageDataVale);
  }

  getStringForVB8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB8 = prefs.getBool('stringValueForVB8') ?? false;
    });
    print("selectedTypeVB8 : $selectedTypeVB8");
    return selectedTypeVB8;
  }

  // 9
  bool selectedTypeVB9=false;

  addStringForVB9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB9', anguageDataVale);
  }

  getStringForVB9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB9 = prefs.getBool('stringValueForVB9') ?? false;
    });
    print("selectedTypeVB9 : $selectedTypeVB9");
    return selectedTypeVB9;
  }

  // 10
  bool selectedTypeVB10=false;

  addStringForVB10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVB10', anguageDataVale);
  }

  getStringForVB10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVB10 = prefs.getBool('stringValueForVB10') ?? false;
    });
    print("selectedTypeVB10 : $selectedTypeVB10");
    return selectedTypeVB10;
  }

  // ........................................lunch ............... //////////////
  // 1
  bool selectedTypeVL1=false;

  addStringForVL1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL1', anguageDataVale);
  }

  getStringForVL1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL1 = prefs.getBool('stringValueForVL1') ?? false;
    });
    print("selectedTypeVL1 : $selectedTypeVL1");
    return selectedTypeVL1;
  }

  // 2
  bool selectedTypeVL2=false;

  addStringForVL2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL2', anguageDataVale);
  }

  getStringForVL2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL2 = prefs.getBool('stringValueForVL2') ?? false;
    });
    print("selectedTypeVL2 : $selectedTypeVL2");
    return selectedTypeVL2;
  }

  // 3
  bool selectedTypeVL3=false;

  addStringForVL3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL3', anguageDataVale);
  }

  getStringForVL3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL3 = prefs.getBool('stringValueForVL3') ?? false;
    });
    print("selectedTypeVL3 : $selectedTypeVL3");
    return selectedTypeVL3;
  }

  // 4
  bool selectedTypeVL4=false;

  addStringForVL4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL4', anguageDataVale);
  }

  getStringForVL4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL4 = prefs.getBool('stringValueForVL4') ?? false;
    });
    print("selectedTypeVL4 : $selectedTypeVL4");
    return selectedTypeVL4;
  }

  // 5
  bool selectedTypeVL5=false;

  addStringForVL5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL5', anguageDataVale);
  }

  getStringForVL5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL5 = prefs.getBool('stringValueForVL5') ?? false;
    });
    print("selectedTypeVL5 : $selectedTypeVL5");
    return selectedTypeVL5;
  }

  // 6
  bool selectedTypeVL6=false;

  addStringForVL6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL6', anguageDataVale);
  }

  getStringForVL6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL6 = prefs.getBool('stringValueForVL6') ?? false;
    });
    print("selectedTypeVL6 : $selectedTypeVL6");
    return selectedTypeVL6;
  }

  // 7
  bool selectedTypeVL7=false;

  addStringForVL7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL7', anguageDataVale);
  }

  getStringForVL7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL7 = prefs.getBool('stringValueForVL7') ?? false;
    });
    print("selectedTypeVL7 : $selectedTypeVL7");
    return selectedTypeVL7;
  }

  // 8
  bool selectedTypeVL8=false;

  addStringForVL8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL8', anguageDataVale);
  }

  getStringForVL8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL8 = prefs.getBool('stringValueForVL8') ?? false;
    });
    print("selectedTypeVL8 : $selectedTypeVL8");
    return selectedTypeVL8;
  }

  // 9
  bool selectedTypeVL9=false;

  addStringForVL9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL9', anguageDataVale);
  }

  getStringForVL9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL9 = prefs.getBool('stringValueForVL9') ?? false;
    });
    print("selectedTypeVL9 : $selectedTypeVL9");
    return selectedTypeVL9;
  }

  // 10
  bool selectedTypeVL10=false;

  addStringForVL10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVL10', anguageDataVale);
  }

  getStringForVL10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVL10 = prefs.getBool('stringValueForVL10') ?? false;
    });
    print("selectedTypeVL10 : $selectedTypeVL10");
    return selectedTypeVL10;
  }

  // ..............................dinner .............................///////

  // 1
  bool selectedTypeVD1=false;

  addStringForVD1(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD1', anguageDataVale);
  }

  getStringForVD1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD1 = prefs.getBool('stringValueForVD1') ?? false;
    });
    print("selectedTypeVD1 : $selectedTypeVD1");
    return selectedTypeVD1;
  }

  // 2
  bool selectedTypeVD2=false;

  addStringForVD2(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD2', anguageDataVale);
  }

  getStringForVD2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD2 = prefs.getBool('stringValueForVD2') ?? false;
    });
    print("selectedTypeVD2 : $selectedTypeVD2");
    return selectedTypeVD2;
  }

  // 3
  bool selectedTypeVD3=false;

  addStringForVD3(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD3', anguageDataVale);
  }

  getStringForVD3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD3 = prefs.getBool('stringValueForVD3') ?? false;
    });
    print("selectedTypeVD3 : $selectedTypeVD3");
    return selectedTypeVD3;
  }

  // 4
  bool selectedTypeVD4=false;

  addStringForVD4(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD4', anguageDataVale);
  }

  getStringForVD4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD4 = prefs.getBool('stringValueForVD4') ?? false;
    });
    print("selectedTypeVD4 : $selectedTypeVD4");
    return selectedTypeVD4;
  }

  // 5
  bool selectedTypeVD5=false;

  addStringForVD5(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD5', anguageDataVale);
  }

  getStringForVD5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD5 = prefs.getBool('stringValueForVD5') ?? false;
    });
    print("selectedTypeVD5 : $selectedTypeVD5");
    return selectedTypeVD5;
  }

  // 6
  bool selectedTypeVD6=false;

  addStringForVD6(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD6', anguageDataVale);
  }

  getStringForVD6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD6 = prefs.getBool('stringValueForVD6') ?? false;
    });
    print("selectedTypeVD6 : $selectedTypeVD6");
    return selectedTypeVD6;
  }

  // 7
  bool selectedTypeVD7=false;

  addStringForVD7(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD7', anguageDataVale);
  }

  getStringForVD7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD7 = prefs.getBool('stringValueForVD7') ?? false;
    });
    print("selectedTypeVD7 : $selectedTypeVD7");
    return selectedTypeVD7;
  }

  // 8
  bool selectedTypeVD8=false;

  addStringForVD8(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD8', anguageDataVale);
  }

  getStringForVD8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD8 = prefs.getBool('stringValueForVD8') ?? false;
    });
    print("selectedTypeVD8 : $selectedTypeVD8");
    return selectedTypeVD8;
  }

  // 9
  bool selectedTypeVD9=false;

  addStringForVD9(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD9', anguageDataVale);
  }

  getStringForVD9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD9 = prefs.getBool('stringValueForVD9') ?? false;
    });
    print("selectedTypeVD9 : $selectedTypeVD9");
    return selectedTypeVD9;
  }

  // 10
  bool selectedTypeVD10=false;

  addStringForVD10(bool anguageDataVale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stringValueForVD10', anguageDataVale);
  }

  getStringForVD10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTypeVD10 = prefs.getBool('stringValueForVD10') ?? false;
    });
    print("selectedTypeVD10 : $selectedTypeVD10");
    return selectedTypeVD10;
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
