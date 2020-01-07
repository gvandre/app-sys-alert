import 'package:flutter/material.dart';
import 'package:sys_alert/utils/FirebaseAuth.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget sectionImage() {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              FlutterLogo(
                size: 100,
              ),
              Text('Bienvenido', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25))
            ],
          )
        ],
      )
    );
  }
  Widget sectionInfo() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Text('O ingrese con:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
        )
      ],
    );
  }
  Widget sectionLogin(context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 15),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: 'Ingrese correo',
                    hintStyle: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 15),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: 'Ingrese contraseña',
                    hintStyle: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)
                    )
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Ingresar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )
                ),
                onPressed: () {
                },
              ),
              sectionInfo(),
              sectionBtnGmail(context)
            ],
          )
        ),
      )
    );
  }
  Widget sectionBtnGmail(context) {
    return RaisedButton(
      color: Color.fromARGB(255, 199, 22, 16),
      child: Container(
        width: 150,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, right: 15),
              child: Image.asset('images/gmail.png', width: 30, height: 30, )
            ),
            Expanded(
              child: Text(
                'Gmail',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white,)
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        print('click');
        AuthProvider auth = new AuthProvider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          sectionImage(),
          sectionLogin(context)
        ],
      ),
    );
  }
}