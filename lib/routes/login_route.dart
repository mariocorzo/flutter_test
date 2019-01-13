import 'package:flutter/material.dart';
import 'package:flutter_module_tests/services/authentication.dart';

enum FormMode { LOGIN, SIGNUP }

class LoginScreen extends StatefulWidget {
  LoginScreen({this.onSignedIn});

  final BaseAuth auth = FirebaseAuthentication();
  final VoidCallback onSignedIn;

  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
          child: Form(
            key: _formKey,
              child: ListView(
        children: <Widget>[_showEmailInput(), _showPasswordInput(), _showPrimaryButton(), _showSecondaryButton()],
      ))),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: _formMode == FormMode.LOGIN
                ? new Text('Login', style: new TextStyle(fontSize: 20.0, color: Colors.white))
                : new Text('Create account', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: _validateAndSubmit,
          ),
        ));
  }

  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          print('Signed up user: $userId');
        }

        setState(() {
          _isLoading = false;
        });



        if (userId.length > 0 && userId != null) {
//          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _showSecondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Create an account', style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Have an account? Sign in', style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN ? _changeFormToSignUp : _changeFormToLogin,
    );
  }
}
