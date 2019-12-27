// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
// import '../firebase/Conection.dart';
// class Chartline extends StatefulWidget {
//   @override
//   _ChartLineState createState()=> _ChartLineState();
// }
// class _ChartLineState extends State<Chartline> {
//   List<SensorValues> lvalues;
//   Conection cn = new Conection();
//   bool firstEvent = true;

//   Widget buildChartLine(values){
//     var series = [
//       new charts.Series<SensorValues, DateTime>(
//         id: 'Sales',
//         domainFn: (SensorValues data, _) => data.time,
//         measureFn: (SensorValues data, _) => data.temp,
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         data: values,
//       ),
//       new charts.Series<SensorValues, DateTime>(
//         id: 'Sales2',
//         domainFn: (SensorValues data, _) => data.time,
//         measureFn: (SensorValues data, _) => data.hum,
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         data: values,
//       ),
//       new charts.Series<SensorValues, DateTime>(
//         id: 'Sales3',
//         domainFn: (SensorValues data, _) => data.time,
//         measureFn: (SensorValues data, _) => data.gas,
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         data: values,
//       ),
//     ];
//     var chart = new charts.TimeSeriesChart(
//       series,
//       animate: true,
//       dateTimeFactory: const charts.LocalDateTimeFactory(),
//       // dateTimeFactory: const charts.LocalDateTimeFactory(),
//       domainAxis: new charts.DateTimeAxisSpec(
//         tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
//           minute: new charts.TimeFormatterSpec(
//             format: 'mm',
//             transitionFormat: 'HH:mm'
//           )
//         )
//       ),
//     );
//     return Center(
//       child: Container(
//         margin: new EdgeInsets.all(20.0),
//         color: Colors.white,
//         height: 300,
//         child: chart,
//       ),
//     );
//   }
//   Widget futureWidget() {
//     Conection cxn = new Conection();
//     return FutureBuilder<List<SensorValues>>(
//       future: cxn.getData(),
//       builder: (BuildContext context, AsyncSnapshot<List<SensorValues>> snapshot) {
//         List<Widget> children;
//         if (snapshot.hasData) {
//           children = <Widget>[
//             buildChartLine(snapshot.data)
//           ];
//         } else if (snapshot.hasError) {
//           children = <Widget>[
//             Icon(
//               Icons.error_outline,
//               color: Colors.red,
//               size: 60,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 16),
//               child: Text('Error: ${snapshot.error}'),
//             )
//           ];
//         } else {
//           children = <Widget>[
//             SizedBox(
//               child: CircularProgressIndicator(),
//               width: 60,
//               height: 60,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 16),
//               child: Text('Awaiting result...'),
//             )
//           ];
//         }
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: children,
//           ),
//         );
//       }
//     );
//   }
//   Widget anotherOption(values) {
//     List<Widget> children;
//     if (values != null) {
//       children = <Widget>[
//         buildChartLine(values)
//       ];
//     } else if (values == null) {
//       children = <Widget>[
//         Icon(
//           Icons.error_outline,
//           color: Colors.red,
//           size: 60,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 16),
//           child: Text('Error: ${values}'),
//         )
//       ];
//     } else {
//       children = <Widget>[
//         SizedBox(
//           child: CircularProgressIndicator(),
//           width: 60,
//           height: 60,
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 16),
//           child: Text('Awaiting result...'),
//         )
//       ];
//     }
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: children,
//       ),
//     );
//   }
//   void getValues() {
//     print('Se ejecuta');
//     cn.getData().then((value) {
//       setState(() {
//         this.lvalues = value;
//       });
//     });
//   }
//   void addEvent(data) {
//     print("Ejecute addEvent");
//     if (firstEvent) {
//       print(data.snapshot.value);
//     } else {
//       var v = data.snapshot.value;
//       print("Get v");
//       print(v);
//       setState(() {
//         this.lvalues.add(new SensorValues(
//             v['temp'],
//             v['gas'],
//             v['hum'],
//             DateTime.parse(v['createdAt'])
//         ));
//       });
//     }
//     firstEvent = false;
//   }

//   @override
//   initState() {
//     super.initState();
//     this.getValues();
//     cn.listenAdd(this.addEvent);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return anotherOption(lvalues);
//   }

// }
// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }