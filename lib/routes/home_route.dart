import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_tests/blocs/bloc_provider_test.dart';
import 'package:flutter_module_tests/services/authentication.dart';

class HomeScreen extends StatelessWidget {

  final BaseAuth _auth = FirebaseAuthentication();

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
              onPressed: () {
                bloc.blocAdd.add(22);
              },
            ),
            RaisedButton(
              child: Text("Administrar Carpetas"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("LogOut"),
              onPressed: _logOut,
            ),
            StreamBuilder<int>(
              stream: bloc.count,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
            FutureBuilder<FirebaseUser>(
              future: _auth.getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData)
                  return Text("Welcome ${snapshot.data.email}");
                return Text("NO DATA");
              },
            )
          ],
        ),
      )),
    );
  }

  void _logOut() async{
    try {
      await _auth.signOut();
//    onSignedOut();
    } catch (e) {
    print(e);
    }
  }
}
