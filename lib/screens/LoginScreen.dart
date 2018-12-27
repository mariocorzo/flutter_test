import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      body: Center(
          child: Container(
              child: RaisedButton(onPressed: () => _goToHomeScreen(context), child: Text("HOME"),)
          )
      ),
    );
  }

  void _goToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }
}
