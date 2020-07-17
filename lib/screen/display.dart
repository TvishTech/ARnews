import 'package:flutter/material.dart';
import 'package:flutterapp/drawer.dart';
import 'package:flutterapp/screen/camera.dart';
import 'package:flutterapp/screen/face.dart';

class Display extends StatefulWidget {
  static const routeName = 'display';

  @override
  _DisplayState createState() => _DisplayState();
}

const List<String> url = [
  'images/amar ujala.jpeg',
  'images/dainik bhaskar.jpeg',
  'images/dainik  jagran.jpeg',
  'images/hindustan times.jpeg',
  'images/prabhat khabar.jpeg',
  'images/The indian express.jpeg',
  'images/times of india.jpeg',
];

class _DisplayState extends State<Display> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 2),
            itemBuilder: (context, i) => GridTile(
              child: Image.asset(url[i], fit: BoxFit.contain),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  url[i].substring(7),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            itemCount: url.length,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AugmentedFacesScreen.routeName);
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
