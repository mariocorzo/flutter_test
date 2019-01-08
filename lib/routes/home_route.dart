import 'package:flutter/material.dart';
import 'package:flutter_module_tests/blocs/bloc_provider_test.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderTest.of(context);
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
                  onPressed: () {bloc.blocAdd.add(22);},),
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