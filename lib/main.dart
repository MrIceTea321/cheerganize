import 'package:cheerganize/screens/NewRoutine.dart';
import 'package:flutter/material.dart';

import 'screens/HomeScreen.dart';
import 'screens/Settings.dart';

void main() {
  runApp(Cheerganize());
}

class Cheerganize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheerganize',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF181d21),
          scaffoldBackgroundColor: Color(0xFF181d21),
          accentColor: Color(0xffb6a24f)),
      //darkTheme: ThemeData.dark().copyWith(accentColor: Colors.grey),
      home: HomeScreen(),
      routes: {
        'HomeScreen':(context)=>HomeScreen(),
        'Settings':(context)=>Settings(),
        'NewRoutine':(context)=>NewRoutine(),
      },
    );
  }
}
