import 'package:flutter/material.dart';

import 'map_home/map_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapScreen(),
    );
  }
}
