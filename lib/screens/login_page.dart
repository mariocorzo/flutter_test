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

  Widget _SubmitButton() {
    if (_formMode == FormMode.SIGNIN) {
      return new Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: new Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.blueAccent.shade100,
              elevation: 5.0,
              child: new MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  color: Colors.blue,
                  child: new Text('Login',
                      style: new TextStyle(fontSize: 20.0,
                          color: Colors.white)),
                  onPressed: validateAndSubmit)));
    } else {
      return new Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: new Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.lightBlueAccent.shade100,
              elevation: 5.0,
              child: new MaterialButton(minWidth: 200.0,
                height: 42.0,
                color: Colors.blue,
                child: new Text('Create account',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: validateAndSubmit,)));
    }
  }


  void validateAndSubmit() {
  }


}
enum FormMode { SIGNIN, SIGNUP }

