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
        color: Color.fromRGBO(8, 48, 95, 1),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 25,
      ),
      constraints: BoxConstraints.expand(
        height: 150
      ),
      // color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sensores',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                )
              )
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'images/icont.png',
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        child: Text('Temperatura', style: TextStyle(fontSize: 18, color: Colors.green),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'images/smoke-detector.png',
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        child: Text('Humo', style: TextStyle(fontSize: 18, color: Colors.red),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            'images/gasoline.png',
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        child: Text('Gas', style: TextStyle(fontSize: 18, color: Colors.blue),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}