import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class Conection {
  var databaseReference;
  String nodo = 'sensores';

  Conection () {
    this.databaseReference = FirebaseDatabase.instance.reference();
  }

  Future<List<SensorValues>> getData () async {
    List<SensorValues> list = new List<SensorValues>();
    await databaseReference.child(nodo).once().then((DataSnapshot snapshot) {
      final data = snapshot.value;
      print(data.values);
      if (data.isNotEmpty) {
        print('Con datos');
        data.forEach((k, v) {
          print(k);
          list.add(new SensorValues(
              double.parse(v['temp']),
              double.parse(v['gas']),
              double.parse(v['hum'])
          ));
        });
      } else {
        print('Sin datos');
        list.add(new SensorValues(0, 0, 0));
      }
    });
    return list;
  }
}

class SensorValues {
  final double temp;
  final double gas;
  final double hum;
  SensorValues(this.temp, this.gas, this.hum);
}
