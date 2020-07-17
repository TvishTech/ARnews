import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CameraScreen extends StatefulWidget {
  static const routeName = 'camera';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  ArCoreController arCoreController;


  _onArCoreViewCreated(ArCoreController _arCoreController) {
    arCoreController = _arCoreController;
    _addCube(_arCoreController);
  }

  _addCube(ArCoreController _arCoreController) {
    final node = ArCoreNode(
      shape: ArCoreCube(
        size: vector.Vector3(0.2, 0.2, 0.2),
        materials: [
          ArCoreMaterial(color: Color.fromRGBO(0, 0, 0, 0.9), texture: "images/dainik bhaskar.jpeg",),
        ],
      ),
      position: vector.Vector3(0, 0, -0.5),
    );

    _arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'TEXT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
              ),
              height: 600,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: screenSize.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/amar ujala.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text('images/amar ujala.jpeg')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/dainik bhaskar.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text('images/dainik bhaskar.jpeg')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/dainik  jagran.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text(
                          'images/dainik  jagran.jpeg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/hindustan times.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text('images/hindustan times.jpeg')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/prabhat khabar.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text(
                          'images/prabhat khabar.jpeg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/The indian express.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text(
                          'images/The indian express.jpeg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 160.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                          'images/times of india.jpeg',
                          fit: BoxFit.scaleDown,
                        )),
                        Text('images/times of india.jpeg')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
