import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../firebase/Conection.dart';

class ChartSensorValues extends StatefulWidget {

  @override
  _ChartSensorState createState()=> _ChartSensorState();
}

class _ChartSensorState extends State<ChartSensorValues> {
  List<FlSpot> chartDataHum = new List<FlSpot>();
  List<FlSpot> chartDataGas = new List<FlSpot>();
  List<FlSpot> chartDataTemp = new List<FlSpot>();
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
        String formatDate = '${ev.time.hour}:${ev.time.minute}:${ev.time.second}';
        xLegendValue.add(formatDate);
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
    List<Widget> toShow = [];
    if (this.xLegendValue.length > 0) {
      toShow = this.paintChart();
    } else {
      toShow = <Widget>[
        SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Awaiting result...'),
        )
      ];
    }
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: toShow,
      ),
    );
  }

  List<Widget> paintChart () {
    return [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Valores de los sensores integrados',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 35),
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          const FlLine(color: Colors.blue, strokeWidth: 4),
                          const FlDotData(dotSize: 8, dotColor: Colors.deepOrange),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.blueAccent,
                    )
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: this.chartDataHum,
                      isCurved: true,
                      barWidth: 4,
                      colors: [
                        Colors.red,
                      ],
                      belowBarData: BarAreaData(
                        show: false,
                        colors: [
                          Colors.orange.withOpacity(0.5),
                          Colors.orange.withOpacity(0.0),
                        ],
                        gradientColorStops: [0.5, 1.0],
                        gradientFrom: const Offset(0, 0),
                        gradientTo: const Offset(0, 1),
                        spotsLine: BarAreaSpotsLine(
                          show: true,
                          flLineStyle: const FlLine(
                            color: Colors.blue,
                            strokeWidth: 2,
                          )
                        )
                      ),
                      dotData: FlDotData(
                        show: true,
                        dotColor: Colors.deepOrange,
                        dotSize: 6
                      ),
                    ),
                  ],
                  minY: 0,
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 5.0,
                    verticalInterval: 1.0
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: SideTitles(
                      showTitles: true,
                      textStyle: const TextStyle(color: Colors.white, fontSize: 15),
                      interval: 5.0,
                      getTitles: (value) {
                        int yData = value.toInt();
                        return '$yData';
                      }
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                      getTitles: (value) {
                        int xIndex = value.toInt();
                        return '${xLegendValue[xIndex]}';
                      }
                    )
                  ),
                ),
              ),
            )
          )
        ],
      )
    ];
  }
}