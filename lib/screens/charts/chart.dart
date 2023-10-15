
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/hive_data_model.dart';
import '../btm_screen.dart';

class LineChartSample2 extends StatefulWidget {
  // final List<FlSpot> rates;
  // final int days;
  // final List<FlSpot> rates2;
  // final int days2;
  const LineChartSample2({
    Key? key,
    // this.rates,
    // this.days,
    // this.rates2,
    // this.days2,
  });

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  ScrollController scrollController = ScrollController();

  ScrollController scrollController2 = ScrollController();

  //
  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  List<Map<String, dynamic>> _items = [];
  Box _shoppingBox = Hive.box('BMI_Activity');
  List<HiveModel> dataList=[];

  void refreshItems() {
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

    for(int i=0;i<data.length; i++){
      HiveModel bmiData = HiveModel.fromJson(data[i]);
      dataList.add(bmiData);
    }

    print("_items btm: $_items");
  }

  @override
  void initState() {
    refreshItems();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae9ee),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Statistics",
          style: GoogleFonts.robotoSlab(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Text(
                              "BMI",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.robotoSlab(
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBarScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Update",
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

                    SfCartesianChart(

                      primaryYAxis: CategoryAxis(
                        title: AxisTitle(text: "BMI"),
                        majorGridLines: MajorGridLines(width: .5),
                        minimum: 15
                        // axisLine: AxisLine(width: 0)
                      ),

                      primaryXAxis: CategoryAxis(
                        title: AxisTitle(text: "Time"),
                          majorGridLines: MajorGridLines(width: .5),
                          // axisLine: AxisLine(width: 0)
                      ),
                        legend: Legend(

                        ),
                        series: <SplineAreaSeries<HiveModel, String>>[ // Initialize line series.
                          SplineAreaSeries<HiveModel, String>(
                            animationDelay: 5,
                              animationDuration: 100,
                            color: Color(0x509C27B0),
                              splineType: SplineType.cardinal,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Color(0xff9C27B0),
                                // Color(0x509C27B0),
                                Color(0x109C27B0),
                              ]),

                              isVisible: true,
                              enableTooltip: true,
                              dataSource: dataList,
                              xValueMapper: (HiveModel data, _) => DateFormat.yMd().format(data.date),
                              yValueMapper: (HiveModel data, _) => num.parse(data.name.replaceAll("%", ""))
                          )
                        ]
                      

                    ),
                    // Expanded(
                    //   child: SizedBox(
                    //     width: MediaQuery.of(context).size.width,
                    //     child: SingleChildScrollView(
                    //       controller: scrollController,
                    //       scrollDirection: Axis.horizontal,
                    //       // physics: BouncingScrollPhysics(),
                    //       child: SizedBox(
                    //         width: 1000,
                    //         child: Card(
                    //           elevation: 1,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           color: const Color(0xff020227),
                    //           child: LineChart(
                    //             LineChartData(
                    //               backgroundColor: Colors.black,
                    //               lineTouchData: LineTouchData(
                    //                 enabled: true,
                    //               ),
                    //               gridData: FlGridData(
                    //                 show: true,
                    //                 drawHorizontalLine: false,
                    //                 drawVerticalLine: true,
                    //                 verticalInterval: 1,
                    //                 horizontalInterval: 1,
                    //                 getDrawingVerticalLine: (value) {
                    //                   return FlLine(
                    //                     color: const Color(0xff37434d),
                    //                     strokeWidth: 1,
                    //                   );
                    //                 },
                    //               ),
                    //               titlesData: FlTitlesData(
                    //                 show: true,
                    //                 bottomTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     reservedSize: 30,
                    //                     getTitlesWidget: bottomTitleWidgets,
                    //                     interval: 1,
                    //                   ),
                    //                 ),
                    //                 leftTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     getTitlesWidget: leftTitleWidgets,
                    //                     reservedSize: 30,
                    //                     interval: 1,
                    //                   ),
                    //                 ),
                    //                 topTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     getTitlesWidget: topTitleWidgets,
                    //                     reservedSize: 30,
                    //                   ),
                    //                 ),
                    //                 rightTitles: AxisTitles(
                    //                   axisNameSize: 0,
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     reservedSize: 20,
                    //                     interval: 3134324120,
                    //                   ),
                    //                 ),
                    //               ),
                    //               borderData: FlBorderData(
                    //                 show: true,
                    //                 border: Border.all(
                    //                   strokeAlign: BorderSide.strokeAlignInside,
                    //                   color: const Color(0xff37434d),
                    //                 ),
                    //               ),
                    //               minX: 1,
                    //               maxX: double.parse(
                    //                   _listOfDates.last.toString()), // days//
                    //               minY: 0,
                    //               maxY: 70,
                    //               lineBarsData: [
                    //                 LineChartBarData(
                    //                   show: true,
                    //                   preventCurveOverShooting: true,
                    //                   spots: _spots, // rates  ///
                    //                   isCurved: true,
                    //                   gradient: LinearGradient(
                    //                     colors: [
                    //                       ColorTween(
                    //                               begin: gradientColors[0],
                    //                               end: gradientColors[1])
                    //                           .lerp(0.2),
                    //                       ColorTween(
                    //                               begin: gradientColors[0],
                    //                               end: gradientColors[1])
                    //                           .lerp(0.2),
                    //                     ],
                    //                   ),
                    //                   barWidth: 3,
                    //                   isStrokeCapRound: true,
                    //                   dotData: FlDotData(
                    //                     show: true,
                    //                   ),
                    //                   belowBarData: BarAreaData(
                    //                     show: true,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Text(
                              "Weight",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.robotoSlab(
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBarScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Update",
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
                    SfCartesianChart(
                        primaryYAxis: CategoryAxis(
                            title: AxisTitle(text: "Weight"),
                            majorGridLines: MajorGridLines(width: .5),
                            minimum: 15
                          // axisLine: AxisLine(width: 0)
                        ),

                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(text: "Time"),
                          majorGridLines: MajorGridLines(width: .5),
                          // axisLine: AxisLine(width: 0)
                        ),
                        legend: Legend(

                        ),
                        series: <SplineAreaSeries<HiveModel, String>>[ // Initialize line series.
                          SplineAreaSeries<HiveModel, String>(

                              color: Color(0x509C27B0),
                              splineType: SplineType.cardinal,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff9C27B0),
                                    // Color(0x509C27B0),
                                    Color(0x109C27B0),
                                  ]),
                              animationDuration: 5,
                              isVisible: true,
                              enableTooltip: true,
                              dataSource: dataList,
                              xValueMapper: (HiveModel data, _) => DateFormat.yMd().format(data.date),
                              yValueMapper: (HiveModel data, _) => data.weight
                          )
                        ]


                    ),
                    // SizedBox(height: 8),
                    // Expanded(
                    //   child: SizedBox(
                    //     width: MediaQuery.of(context).size.width,
                    //     child: SingleChildScrollView(
                    //       scrollDirection: Axis.horizontal,
                    //       controller: scrollController2,
                    //       // physics: BouncingScrollPhysics(),
                    //       child: SizedBox(
                    //         width: 1000,
                    //         child: Card(
                    //           elevation: 1,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(16),
                    //           ),
                    //           color: const Color(0xff020227),
                    //           child: LineChart(
                    //             LineChartData(
                    //               backgroundColor: Colors.black,
                    //               lineTouchData: LineTouchData(
                    //                 enabled: true,
                    //               ),
                    //               gridData: FlGridData(
                    //                 show: true,
                    //                 drawHorizontalLine: false,
                    //                 drawVerticalLine: true,
                    //                 verticalInterval: 1,
                    //                 horizontalInterval: 1,
                    //                 getDrawingVerticalLine: (value) {
                    //                   return FlLine(
                    //                     color: const Color(0xff37434d),
                    //                     strokeWidth: 1,
                    //                   );
                    //                 },
                    //               ),
                    //               titlesData: FlTitlesData(
                    //                 show: true,
                    //                 bottomTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     reservedSize: 30,
                    //                     getTitlesWidget: bottomTitleWidgets2,
                    //                     interval: 1,
                    //                   ),
                    //                 ),
                    //                 leftTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     getTitlesWidget: leftTitleWidgets2,
                    //                     reservedSize: 30,
                    //                     interval: 1,
                    //                   ),
                    //                 ),
                    //                 topTitles: AxisTitles(
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     getTitlesWidget: topTitleWidgets2,
                    //                     reservedSize: 30,
                    //                   ),
                    //                 ),
                    //                 rightTitles: AxisTitles(
                    //                   axisNameSize: 0,
                    //                   sideTitles: SideTitles(
                    //                     showTitles: true,
                    //                     reservedSize: 20,
                    //                     interval: 3134324120,
                    //                   ),
                    //                 ),
                    //               ),
                    //               borderData: FlBorderData(
                    //                 show: true,
                    //                 border: Border.all(
                    //                   strokeAlign: BorderSide.strokeAlignInside,
                    //                   color: const Color(0xff37434d),
                    //                 ),
                    //               ),
                    //               minX: 1,
                    //               maxX:
                    //                   double.parse(_listOfDates2.last.toString()),
                    //               minY: 0,
                    //               maxY: 100,
                    //               lineBarsData: [
                    //                 LineChartBarData(
                    //                   show: true,
                    //                   preventCurveOverShooting: true,
                    //                   spots: _spots2,
                    //                   isCurved: true,
                    //                   gradient: LinearGradient(
                    //                     colors: [
                    //                       ColorTween(
                    //                               begin: gradientColors[0],
                    //                               end: gradientColors[1])
                    //                           .lerp(0.2),
                    //                       ColorTween(
                    //                               begin: gradientColors[0],
                    //                               end: gradientColors[1])
                    //                           .lerp(0.2),
                    //                     ],
                    //                   ),
                    //                   barWidth: 3,
                    //                   isStrokeCapRound: true,
                    //                   dotData: FlDotData(
                    //                     show: true,
                    //                   ),
                    //                   belowBarData: BarAreaData(
                    //                     show: true,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
          ),
    );
  }

  //////////////////////////////////////// BMI //////////////////////////////////////////

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    int day = value.toInt();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '$day',
        style: style,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 10:
        text = '10';
        break;
      case 20:
        text = "20";
        break;
      case 30:
        text = "30";
        break;
      case 40:
        text = "30";
        break;
      case 50:
        text = "50";
        break;
      case 60:
        text = "60";
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget topTitleWidgets(double value, TitleMeta meta) {
    var dateTime = DateTime.now();

    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      height: 1.5,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 6:
        text = DateFormat("MMMM").format(dateTime);
        break;

      default:
        return Container();
    }

    return Text(
      text,
      style: style,
    );
  }

  //////////////////////////////////////// WEIGHTS //////////////////////////////////////////

  Widget bottomTitleWidgets2(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    Widget text;
    int day = value.toInt();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '$day',
        style: style,
      ),
    );
  }

  Widget leftTitleWidgets2(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.normal,
      fontSize: 8,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 10:
        text = '10kg';
        break;
      case 20:
        text = "20kg";
        break;
      case 30:
        text = "30kg";
        break;
      case 40:
        text = "30kg";
        break;
      case 50:
        text = "50kg";
        break;
      case 60:
        text = "60kg";
        break;
      case 70:
        text = "70kg";
        break;
      case 80:
        text = "80kg";
        break;
      case 90:
        text = "90kg";
        break;
      case 100:
        text = "100kg";
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget topTitleWidgets2(double value, TitleMeta meta) {
    var dateTime = DateTime.now();

    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      height: 1.5,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 6:
        text = DateFormat("MMMM").format(dateTime);
        break;

      default:
        return Container();
    }

    return Text(
      text,
      style: style,
    );
  }
}
