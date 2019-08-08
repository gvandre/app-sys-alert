import 'package:firebase_database/firebase_database.dart';

class Conection {
  var databaseReference;
  String nodo = 'sensores';

  Conection () {
    this.databaseReference = FirebaseDatabase.instance.reference();
  }
  void getData () {
    databaseReference.child(nodo).once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}