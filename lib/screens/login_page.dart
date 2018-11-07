import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState()
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var formKey;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Login Demo"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: formKey,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
              ],
            )),
      ),
    );
  }
}