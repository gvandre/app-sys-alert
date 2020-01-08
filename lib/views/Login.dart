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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Ingrese correo',
                    hintStyle: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)
                    )
                  ),
                  validator: this.validateEmail,
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
                  validator: (String value) {
                    if (value.isEmpty || value.length < 5) return 'Ingrese contraseña válido.';
                    return null;
                  },
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

  // Utils
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Ingrese correo válido.';
    else
      return null;
  }
}