import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/drawer.dart';

class ContactUs extends StatelessWidget {
  static const routeName = 'contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TVISH',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 300,
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.contact_mail, size: 20,),
                  SizedBox(width: 10,),
                  Center(
                    child: Text('Write us at contact-us@tvish.app',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}