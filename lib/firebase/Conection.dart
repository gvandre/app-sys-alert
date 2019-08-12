import 'package:firebase_database/firebase_database.dart';

class Conection {
  var databaseReference;
  String nodo = 'sensores';

  Conection () {
    this.databaseReference = FirebaseDatabase.instance.reference();
  }

  List<SensorValues> getData () {
    List<SensorValues> list = new List<SensorValues>();
    databaseReference.child(nodo).once().then((DataSnapshot snapshot) {
      final data = snapshot.value;
      for (var i = 0; i < data.length; i++) {
        list.add(new SensorValues(data.value1, data.value2, data.value3));
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