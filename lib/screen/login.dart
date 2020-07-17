import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/screen/display.dart';
import '../constants.dart';
import './register.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                child: email == null
                    ? AlertDialog(
                        title: Text(
                          'Please enter your email to login',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : password == null
                        ? AlertDialog(
                            title: Text(
                              'Please enter your password to login',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : RaisedButton(
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Navigator.of(context)
                                      .pushNamed(Display.routeName);
                                }

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            color: Colors.lightBlueAccent,
                            child: Text(
                              'Login',
                            ),
                          ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                child: Text(
                  'Tap Here To SIGN UP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
