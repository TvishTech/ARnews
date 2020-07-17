import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/screen/about.dart';
import 'package:flutterapp/screen/camera.dart';
import 'package:flutterapp/screen/contact.dart';
import 'package:flutterapp/screen/display.dart';
import 'package:flutterapp/screen/face.dart';
import 'package:flutterapp/screen/login.dart';
import 'package:flutterapp/screen/register.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final Directory systemTempDir = Directory.systemTemp;
  final File tempFile = File('${systemTempDir.path}/image_database.imgdb');

  await tempFile.create();
  await rootBundle.load("assests/image_database.imgdb").then((data) {
    tempFile.writeAsBytesSync(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

    runApp(
      MaterialApp(
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
          Display.routeName: (context) => Display(),
          CameraScreen.routeName: (context) => CameraScreen(),
          AboutUs.routeName: (context) => AboutUs(),
          ContactUs.routeName: (context) => ContactUs(),
          AugmentedFacesScreen.routeName: (context) => AugmentedFacesScreen(),
        },
      ),
    );
  }).catchError((error) {
    throw Exception(error);
  });
}
