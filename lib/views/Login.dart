import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatelessWidget {

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
          child: Text('Ingrese con:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
        )
      ],
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
        ProgressDialog pr;
        pr = new ProgressDialog(context, type: ProgressDialogType.Normal, showLogs: true);
        pr.style(
          message: 'Cargando...'
        );
        pr.show();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          sectionImage(),
          sectionInfo(),
          sectionBtnGmail(context)
        ],
      ),
    );
  }
}