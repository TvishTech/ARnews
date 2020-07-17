import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/drawer.dart';

class AboutUs extends StatelessWidget {
  static const routeName = 'about';

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
              child: Text(
                'Tvish is an upcoming e-commerce platform providing cutting edge technology, using which you can try wearables on yourself and many other purchasables like furniture and home decor items. We exist to help you make better buying decisions',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
