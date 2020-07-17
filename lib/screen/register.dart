import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import './display.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = 'register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;
  String confirmPassword;
  String phone;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
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
              SizedBox(
                height: 30.0,
              ),
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
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your name'),
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
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                decoration: kInputDecoration.copyWith(
                    hintText: 'Confirm your password'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: password != confirmPassword
                    ? AlertDialog(
                        title: Text('password do not match'),
                      )
                    : name == null
                            ? AlertDialog(
                                title: Text('Please enter your name'),
                              )
                            : phone == null
                                ? AlertDialog(
                                    title: Text('Please enter your phone'),
                                  )
                                : email == null
                                    ? AlertDialog(
                                        title: Text('Please enter your email'),
                                      )
                                    : RaisedButton(
                                        onPressed: () async {
                                          setState(() {
                                            showSpinner = true;
                                          });
                                          try {
                                            final newUser = await _auth
                                                .createUserWithEmailAndPassword(
                                                    email: email,
                                                    password: password);
                                            if (newUser != null) {
                                              Navigator.of(context).pushNamed(Display.routeName);
                                            }

                                            setState(() {
                                              showSpinner = false;
                                            });
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        color: Colors.blueAccent,
                                        child: Text(
                                          'Register',
                                        ),
                                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
