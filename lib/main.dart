import 'package:Cheerganize/screens/AllRoutines.dart';
import 'package:Cheerganize/screens/NewRoutine.dart';
import 'package:flutter/material.dart';
import 'consts/Constants.dart';
import 'noSqlDb/DbInitiator.dart';
import 'screens/CountsPlan.dart';
import 'screens/HomeScreen.dart';
import 'screens/Settings.dart';

void main() {
  runApp(Cheerganize());
}

class Cheerganize extends StatefulWidget {
  @override
  _Cheerganize createState() => _Cheerganize();
}

class _Cheerganize extends State<Cheerganize> {
  @override
  void initState() {
    super.initState();
    AppDatabase.instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheerganize',
      theme: ThemeData.light().copyWith(
        primaryColor: BasicBlackColor,
        scaffoldBackgroundColor: BasicBlackColor,
        accentColor: BlackPawsColor,
      ),
      home: HomeScreen(),
      routes: {
        'HomeScreen': (context) => HomeScreen(),
        'Settings': (context) => Settings(),
        'NewRoutine': (context) => NewRoutine(),
        'AllRoutines': (context) => AllRoutines(),
        'CountsPlan': (context) => CountsPlan(),
      },
    );
  }
}
