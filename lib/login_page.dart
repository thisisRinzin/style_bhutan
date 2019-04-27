import 'package:flutter/material.dart';
import 'package:login/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'something@gmail.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),borderSide: BorderSide(color: Colors.black26))
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),borderSide: BorderSide(color: Colors.black26))
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.pinkAccent,
        child: Text('Log In',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: logo,
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(36, 0, 36, 18),
                  child: email,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(36, 0, 36, 16),
                  child: password,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: SizedBox(
                    width: double.infinity, // match_parent
                    child: loginButton,
                  ),
                ),
                forgotLabel
              ],
            ),
          )
        ],
      ),
    );
  }
}
