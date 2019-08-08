import 'package:flutter/material.dart';
class LegendChart extends StatelessWidget {
  LegendChart();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0)
        ),
        color: Colors.red
      ),
      margin: new EdgeInsets.symmetric(
        horizontal: 5
      ),
      constraints: BoxConstraints.expand(
        height: 200
      ),
      // color: Colors.amberAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('First Container'),
          Text('First Container'),
          Text('First Container'),
        ],
      ),
    );
  }
}