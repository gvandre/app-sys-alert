import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../firebase/Conection.dart';

class ChartSensorValues extends StatefulWidget {

  @override
  _ChartSensorState createState()=> _ChartSensorState();

  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: const <Widget>[
  //             Text(
  //               'Average Line',
  //               style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
  //             ),
  //             Text(
  //               ' and ',
  //               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
  //             ),
  //             Text(
  //               'Indicators',
  //               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: <Widget>[
  //             Expanded(
  //               child: Container(
  //                 padding: EdgeInsets.only(left: 15, right: 15),
  //                 child: LineChart(
  //                   LineChartData(
  //                     lineTouchData: LineTouchData(
  //                       getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
  //                         return spotIndexes.map((spotIndex) {
  //                           final FlSpot spot = barData.spots[spotIndex];
  //                           if (spot.x == 0 || spot.x == 6) {
  //                             return null;
  //                           }
  //                           return TouchedSpotIndicatorData(
  //                             const FlLine(color: Colors.blue, strokeWidth: 4),
  //                             const FlDotData(dotSize: 8, dotColor: Colors.deepOrange),
  //                           );
  //                         }).toList();
  //                       },
  //                       touchTooltipData: LineTouchTooltipData(
  //                           tooltipBgColor: Colors.blueAccent,
  //                           getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
  //                             return touchedBarSpots.map((barSpot) {
  //                               final flSpot = barSpot;
  //                               if (flSpot.x == 0 || flSpot.x == 6) {
  //                                 return null;
  //                               }

  //                               return LineTooltipItem(
  //                                 '${weekDays[flSpot.x.toInt()]} \n${flSpot.y} k colories',
  //                                 const TextStyle(color: Colors.white),
  //                               );
  //                             }).toList();
  //                           }
  //                       )
  //                     ),
  //                     lineBarsData: [
  //                       LineChartBarData(
  //                         spots: const [
  //                           FlSpot(0, 1.3),
  //                           FlSpot(1, 1),
  //                           FlSpot(2, 1.8),
  //                           FlSpot(3, 1.5),
  //                           FlSpot(4, 2.2),
  //                           FlSpot(5, 1.8),
  //                           FlSpot(6, 3),
  //                         ],
  //                         isCurved: true,
  //                         barWidth: 4,
  //                         colors: [
  //                           Colors.orange,
  //                         ],
  //                         belowBarData: BarAreaData(
  //                           show: true,
  //                           colors: [
  //                             Colors.orange.withOpacity(0.5),
  //                             Colors.orange.withOpacity(0.0),
  //                           ],
  //                           gradientColorStops: [0.5, 1.0],
  //                           gradientFrom: const Offset(0, 0),
  //                           gradientTo: const Offset(0, 1),
  //                           spotsLine: BarAreaSpotsLine(
  //                             show: true,
  //                             flLineStyle: const FlLine(
  //                               color: Colors.blue,
  //                               strokeWidth: 2,
  //                             ),
  //                             checkToShowSpotLine: (spot) {
  //                               if (spot.x == 0 || spot.x == 6) {
  //                                 return false;
  //                               }
  //                               return true;
  //                             }
  //                           )
  //                         ),
  //                         dotData: FlDotData(
  //                           show: true,
  //                           dotColor: Colors.deepOrange,
  //                           dotSize: 6,
  //                           checkToShowDot: (spot) {
  //                             return spot.x != 0 && spot.x != 6;
  //                           }
  //                         ),
  //                       ),
  //                     ],
  //                     minY: 0,
  //                     gridData: FlGridData(
  //                       show: true,
  //                       drawHorizontalLine: true,
  //                       drawVerticalLine: true,
  //                       getDrawingHorizontalLine: (value) {
  //                         if (value == 0) {
  //                           return const FlLine(
  //                             color: Colors.deepOrange,
  //                             strokeWidth: 2,
  //                           );
  //                         } else {
  //                           return const FlLine(
  //                             color: Colors.grey,
  //                             strokeWidth: 0.5,
  //                           );
  //                         }
  //                       },
  //                       getDrawingVerticalLine: (value) {
  //                         if (value == 0) {
  //                           return const FlLine(
  //                             color: Colors.black,
  //                             strokeWidth: 2,
  //                           );
  //                         } else {
  //                           return const FlLine(
  //                             color: Colors.grey,
  //                             strokeWidth: 0.5,
  //                           );
  //                         }
  //                       },
  //                     ),
  //                     titlesData: FlTitlesData(
  //                       show: true,
  //                       leftTitles: SideTitles(
  //                         showTitles: true,
  //                         textStyle: const TextStyle(color: Colors.white, fontSize: 15),
  //                       ),
  //                       bottomTitles: SideTitles(
  //                         showTitles: true,
  //                         getTitles: (value) {
  //                           return weekDays[value.toInt()];
  //                         },
  //                         textStyle: const TextStyle(
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       )
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             )
  //           ],
  //         )
  //       ],
  //     )
  //   );
  // }
}

class _ChartSensorState extends State<ChartSensorValues> {
  var chartDataHum = [];
  var chartDataGas = [];
  var chartDataTemp = [];
  var xLegendValue = [];

  Conection cn = new Conection();


  List<LineChartBarData> linesBarData1() {
    LineChartBarData lineChartBarData1 = const LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        Color(0xff4af699),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 =  LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        Color(0xffaa4cfc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        Color(0x00aa4cfc),
      ]),
    );
    LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: const [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      belowBarData: const BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
  @override
  initState() {
    super.initState();
    cn.getData().then((onValue){
      double indexXlegend = 0.0;
      onValue.forEach((ev) {
        xLegendValue.add({
          "index": indexXlegend,
          "xLegend": ev.time,
        });
        chartDataHum.add(
          FlSpot(indexXlegend, ev.hum * 1.0)
        );
        chartDataGas.add(
          FlSpot(indexXlegend, ev.gas * 1.0)
        );
        chartDataTemp.add(
          FlSpot(indexXlegend, ev.temp * 1.0)
        );
        indexXlegend++;
      });

      setState(() {
        this.chartDataGas = chartDataGas;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Number: ${chartDataGas.length}', style: TextStyle(color: Colors.white),),
    );
  }
}