import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../firebase/Conection.dart';
class Chartline extends StatefulWidget {
  // Chartline();
  @override
  _ChartLineState createState()=> _ChartLineState();
/*  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        margin: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 5
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(5.0)
          ),
          color: Color.fromRGBO(8, 48, 95, 1),
        ),
        child: new charts.LineChart(_createSampleData(),
          defaultRenderer: new charts.LineRendererConfig(includeArea: true, stacked: true),
          animate: true,
          primaryMeasureAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.GridlineRendererSpec(
              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.MaterialPalette.white
              ),
              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                color: charts.MaterialPalette.white
              )
            )
          ),
        )
      )
    );
  }*/

  /// Create one series with sample hard coded data.
  static List<charts.Series<SensorValues, double>> _createSampleData() {
    Conection cxn = new Conection();
    var myFakeMobileData;
    cxn.getData().then((onValue){
      print('Get valores');
    });
    myFakeMobileData = [
      new SensorValues(0, 15, 2),
      new SensorValues(1, 75, 3),
      new SensorValues(2, 100, 5),
      new SensorValues(3, 125, 8),
    ];

    print('Mostrar valores');
    return [
      new charts.Series<SensorValues, double>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (SensorValues sv, _) => sv.gas,
        measureFn: (SensorValues sv, _) => sv.temp,
        data: myFakeMobileData,
      ),
    ];
  }
}


class _ChartLineState extends State<Chartline> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hola mundo',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}