import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:Cheerganize/consts/textFields/ConstTextField.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CountsPlan.dart';

class NewRoutine extends StatefulWidget {
  Routine routine = new Routine(name: "", typeofsport: "");
  CountSheet countSheet =
      new CountSheet(bpm: 0, tableList: [], name: '', duration: 0.0);

  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
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
              widget.routine.name = value;
            },
          ),
          ConstTextField(
            hintText: 'Kategorie',
            onChanged: (String value) {
              widget.routine.typeofsport = value;
            },
          ),
          ConstTextField(
            hintText: 'Bpm: z.B. 150',
            onChanged: (String value) {
              widget.countSheet.bpm = int.parse(value);
            },
          ),
          ConstTextField(
            hintText: 'Dauer der Routine in Minuten: z.B. 1.45',
            onChanged: (String value) {
              widget.countSheet.duration = double.parse(value);
            },
          ),
          BigFunctionButton(
            text: '8 - Counts Planung',
            onPress: () {
              widget.countSheet.name = widget.routine.name;
              RoutineDao().insert(widget.routine);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountsPlan(
                    routine: widget.routine,
                    countSheet: widget.countSheet,
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
}
