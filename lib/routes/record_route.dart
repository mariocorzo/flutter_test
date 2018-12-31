import 'package:flutter/material.dart';
import 'package:flutter_module_tests/widgets/buttons/record.dart';

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Record"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Text("Lista de todas las grabaciones")),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("00:00:00",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 1.0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(child: Align(alignment: FractionalOffset.bottomCenter, child: Container(child: RecordButton()))),
            ),
          ],
        ));
  }

  void _startRecording() {}
}
