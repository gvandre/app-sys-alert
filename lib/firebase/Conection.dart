import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class Conection {
  var databaseReference;
  String nodo = 'sensores/valores';

  Conection () {
    this.databaseReference = FirebaseDatabase.instance.reference();
  }

  Future<List<SensorValues>> getData () async {
    List<SensorValues> list = new List<SensorValues>();
    await databaseReference.child(nodo).once().then((DataSnapshot snapshot) {
      final data = snapshot.value;
      if (data.isNotEmpty) {
        print('Con datos');
        print(data);
/*        data.forEach((k, v) {
          print(k);
          list.add(new SensorValues(
              double.parse(v['temp']),
              double.parse(v['gas']),
              double.parse(v['hum'])
          ));
        });*/
      } else {
        print('Sin datos');
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
