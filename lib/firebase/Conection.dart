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
        data.forEach((k, v) {
          list.add(new SensorValues(
            v['temp'],
            v['gas'],
            v['hum'],
            DateTime.parse(v['createdAt'])
          ));
        });
      } else {
        print('Sin datos');
      }
    });
    list.sort((a, b) {
      return a.time.compareTo(b.time);
    });
    return list;
  }

  listenAdd(event) {
    this.databaseReference.child(nodo).limitToLast(1).onChildAdded.listen(event);
  }

}

class SensorValues {
  final int temp;
  final int gas;
  final int hum;
  final DateTime time;
  SensorValues(this.temp, this.gas, this.hum, this.time);
}
