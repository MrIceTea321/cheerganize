import 'dart:collection';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
  Routine routine = new Routine("", "");
  CountSheet countSheet = new CountSheet(0, 0.0, "", "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              countSheet.label = routine.name;
              dbOperations(routine, countSheet);
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

  Future<void> dbOperations(Routine routine, CountSheet countSheet) async {
    DbInitiator.db.insert(countSheet.toMap(), DbInitiator.TABLE_COUNT_SHEET_NAME);
    DbInitiator.db.insert(routine.toMap(), DbInitiator.TABLE_ROUTINE_NAME);
    Routine updateRoutine = await DbInitiator.db.getRoutineObjectFromDb
      (routine.name);
    countSheet.label = updateRoutine.name;
    CountSheet relevantCountSheet = await DbInitiator.db.getCountSheetObjectFromDb(
        countSheet.label);
    updateRoutine.countsheetid = relevantCountSheet.countsheetid;
    routine.countsheetid = relevantCountSheet.countsheetid;
    countSheet.countsheetid = relevantCountSheet.countsheetid;
    DbInitiator.db.updateRoutineObject(updateRoutine);
    DbInitiator.db.updateCountSheetObject(countSheet);
    DbInitiator.db.printAll(DbInitiator.TABLE_COUNT_SHEET_NAME);
    print('countSheet nach dem Update mit label');
    DbInitiator.db.printAll(DbInitiator.TABLE_ROUTINE_NAME);
  }

  Routine buildRoutineObject(String name, String typeOfSport) {
    if (name == null) {
      name = 'kein Name angegeben';
    }
    if (typeOfSport == null) {
      typeOfSport = 'keine Kategorie angegeben';
    }
    return new Routine(name, typeOfSport);
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
    return new CountSheet(bpm, duration, "", label);
  }
}
