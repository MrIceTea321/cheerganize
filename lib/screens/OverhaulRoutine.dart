import 'dart:collection';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/AllRoutines.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:cheerganize/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulRoutine extends StatefulWidget {
  final Routine routine;

  const OverhaulRoutine({Key key, this.routine}) : super(key: key);

  @override
  _OverhaulRoutine createState() => _OverhaulRoutine();
}

class _OverhaulRoutine extends State<OverhaulRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            iconSize: 40.0,
            color: IconColorWhite,
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, 'Settings');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.home),
          color: IconColorWhite,
          iconSize: 40.0,
          onPressed: () {
            Navigator.pushNamed(context, 'HomeScreen');
          },
        ),
        title: Text(
          "Cheerganize",
          style: BlackPawsAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(child: SizedBox(height: 40.0)),
            BlackPawsCircleAvatar(radius: 125.0),
            SizedBox(height: 50.0),
            ConstTextField(
              hintText: 'Neuer Name',
              onChanged: (String value) {
                widget.routine.name = value;
              },
            ),
            ConstTextField(
              hintText: 'Neue Kategorie',
              onChanged: (String value) {
                widget.routine.typeofsport = value;
              },
            ),
            SizedBox(height: 40.0),
            BigFunctionButton(
              text: 'Routine bearbeitet',
              onPress: () {
                DbInitiator.db.updateRoutineObject(widget.routine);
                DbInitiator.db.printAll(DbInitiator.TABLE_ROUTINE_NAME);
                Navigator.pushNamed(context, 'HomeScreen');
              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
          ],
        ),
      ),
    );
  }

  Routine buildRoutineObject(String name, String typeOfSport) {
    return new Routine(name, typeOfSport);
  }
}
