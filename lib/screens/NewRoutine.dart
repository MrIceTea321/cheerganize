import 'dart:collection';
import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/ConstTextField.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CountsPlan.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
  Routine routine = new Routine(name: "", typeofsport: "");
  CountSheet countSheet =
      new CountSheet(bpm: 0, tableList: [], name: '', duration: 0.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
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
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 40.0),
          BlackPawsCircleAvatar(radius: 125.0),
          SizedBox(height: 20.0),
          ConstTextField(
            hintText: 'Name der Routine',
            onChanged: (String value) {
              routine.name = '"' + value + '"';
            },
          ),
          ConstTextField(
            hintText: 'Kategorie',
            onChanged: (String value) {
              routine.typeofsport = '"' + value + '"';
            },
          ),
          ConstTextField(
            hintText: 'Bpm: z.B. 150',
            onChanged: (String value) {
              countSheet.bpm = int.parse(value);
            },
          ),
          ConstTextField(
            hintText: 'Dauer der Routine in Minuten: z.B. 1.45',
            onChanged: (String value) {
              countSheet.duration = double.parse(value);
            },
          ),
          BigFunctionButton(
            text: '8 - Counts Planung',
            onPress: () {
              countSheet.name = routine.name;
              CountSheetDao().insert(countSheet);
              RoutineDao().insert(routine);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountsPlan(
                    routine: routine,
                    countSheet: countSheet,
                  ),
                ),
              );
            },
            marginLTRB: [10.0, 10.0, 10.0, 10.0],
          ),
        ],
      ),
    );
  }

  Routine buildRoutineObject(String name, String typeOfSport) {
    if (name == null) {
      name = 'kein Name angegeben';
    }
    if (typeOfSport == null) {
      typeOfSport = 'keine Kategorie angegeben';
    }
    return new Routine(name: name, typeofsport: typeOfSport);
  }

  CountSheet buildCountSheetObject(int bpm, double duration, String label) {
    if (bpm == null) {
      bpm = 1;
    } else {
      bpm = bpm;
    }
    if (duration == null) {
      duration = 1;
    } else {
      duration = duration;
    }
    return new CountSheet(tableList: [], name: '', bpm: 0, duration: 0.0);
  }
}
