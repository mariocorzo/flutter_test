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

  Widget _logo() {
    return new Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/flutter-icon.png'),
        )
    );
  }

  Widget _sizedBox(_height) {
    return new SizedBox(
      height: _height,
    );
  }

  Widget _emailInput() {
    String _email;
    return new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can \'t be empty' : null,
      onSaved: (value) => _email = value,
    );
  }

  Widget _passwordInput() {
    String _password;
    return new TextFormField(
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can \'t be empty' : null,
      onSaved: (value) => _password = value,
    );
  }


}
enum FormMode { SIGNIN, SIGNUP }

