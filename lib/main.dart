import 'package:flutter/material.dart';
import 'package:flutter_app_location_tracker/application/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Location Tracker',
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
