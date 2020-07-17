import 'package:flutter/material.dart';
import 'package:flutterapp/screen/about.dart';
import 'package:flutterapp/screen/contact.dart';
import 'package:flutterapp/screen/display.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 180,
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              'TVISH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('NewsPaper'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Display.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text('Magazines'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Display.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About Us'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutUs.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.alternate_email),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ContactUs.routeName);
            },
          ),
        ],
      ),
    );
  }
}
