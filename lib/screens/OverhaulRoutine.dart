import 'dart:collection';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulRoutine extends StatefulWidget {
  final Routine routine;
  String nameHelper ="";
   OverhaulRoutine({Key key, this.routine}) : super(key: key);

  @override
  _OverhaulRoutine createState() => _OverhaulRoutine();
}

class _OverhaulRoutine extends State<OverhaulRoutine> {

  @override
  void initState() {
    widget.nameHelper = widget.routine.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
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
            SizedBox(height: 40.0),
            BlackPawsCircleAvatar(radius: 125.0),
            SizedBox(height: 50.0),
            ConstTextField(
              hintText: 'Neuer Name',
              onChanged: (String value) {
                widget.routine.name = '"' + value + '"';
              },
            ),
            ConstTextField(
              hintText: 'Neue Kategorie',
              onChanged: (String value) {
                widget.routine.typeofsport = '"' + value + '"';
              },
            ),
            SizedBox(height: 40.0),
            BigFunctionButton(
              text: 'Routine bearbeitet',
              onPress: () async {
                CountSheet sheet = await DbInitiator.db.getCountSheetObjectFromDb(widget.nameHelper);
                sheet.label = widget.routine.name;
                DbInitiator.db.updateCountSheetObject(sheet);
                DbInitiator.db.updateRoutineObject(widget.routine);
                DbInitiator.db.printAll(DbInitiator.TABLE_ROUTINE_NAME);
                DbInitiator.db.printAll(DbInitiator.TABLE_COUNT_SHEET_NAME);
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
