import 'package:flutter/material.dart';

import 'home/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: HomePage(),
    );
  }
}
