import 'package:cheerganize/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Cheerganize());
}

class Cheerganize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Cheerganize',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(0xffb6a24f),
          scaffoldBackgroundColor: Color(0xFF181d21),
          accentColor: Colors.grey),
     // darkTheme: ThemeData.dark().copyWith(accentColor: Colors.grey),
      home: HomeScreen(),
      routes: {
        'HomeScreen': (context) => HomeScreen(),
      },
    );
  }
}
