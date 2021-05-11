import 'dart:collection';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
  DbInitiator db;
  Map<String, dynamic> row = new HashMap();

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
              onSubmitted: (value) {
                row.putIfAbsent(DbInitiator.COLUMN_ROUTINE_NAME, () => value);
              },
            ),
            ConstTextField(
              hintText: 'Kategorie / Sportart',
              onSubmitted: (value) {
                row.putIfAbsent(
                    DbInitiator.COLUMN_ROUTINE_TYPE_OF_SPORT, () => value);
              },
            ),
            SizedBox(height: 40.0),
            BigFunctionButton(
              text: '8 - Counts Planung',
              onPress: () {
                DbInitiator.db.insert(row, DbInitiator.TABLE_ROUTINE_NAME);
                //Navigator.pushNamed(context, 'CountsPlan');
              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
            BigFunctionButton(
              text: 'Print Rows',
              onPress: () async {
                printALl();
              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
          ],
        ),
      ),
    );
  }

  void printALl() async {
    final allRows =
        await DbInitiator.db.queryAllRows(DbInitiator.TABLE_ROUTINE_NAME);
    allRows.forEach((element) {
      print(element);
    });
  }
}
