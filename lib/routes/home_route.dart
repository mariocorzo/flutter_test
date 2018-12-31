import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Grabar"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/record");
                  },
                ),
                RaisedButton(
                  child: Text("Ver Archivos Grabados"),
                  onPressed: () {},),
                RaisedButton(
                  child: Text("Administrar Carpetas"),
                  onPressed: () {},),
              ],
            ),
          )
      ),
    );
  }
}