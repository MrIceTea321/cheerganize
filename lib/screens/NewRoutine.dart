import 'dart:collection';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
  String name;
  String typeOfSport;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            BlackPawsCircleAvatar(radius: 125.0),
            SizedBox(height: 50.0),
            ConstTextField(
              hintText: 'Name der Routine',
              onSubmitted: (String value) {
                name = value;
              },
            ),
            ConstTextField(
              hintText: 'Kategorie / Sportart',
              onSubmitted: (String value) {
                typeOfSport = value;
              },
            ),
            SizedBox(height: 40.0),
            BigFunctionButton(
              text: '8 - Counts Planung',
              onPress: () {
                Routine routine = buildRoutineObject(name, typeOfSport);
                DbInitiator.db
                    .insert(routine.toMap(), DbInitiator.TABLE_ROUTINE_NAME);
                DbInitiator.db.printALl(DbInitiator.TABLE_ROUTINE_NAME);
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => CountsPlan(
                      routine: routine,
                    ),
                  ),
                );
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
