import 'package:firebase_database/firebase_database.dart';

class Conection {
  final databaseReference = FirebaseDatabase.instance.reference();

  Conection () {
    print('Hola mundo');
    databaseReference.child('sensores').once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
/*  void getData () {
    databaseReference.once().then((DataSnapshot datasnapshot) {
      print(datasnapshot.value);
    });
  }*/
}