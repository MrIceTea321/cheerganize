import 'dart:convert';

import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/consts/TableCellTextOutputField.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'RoutineStatus.dart';

class OverhaulCountsPlan extends StatefulWidget {
  OverhaulCountsPlan({@required this.routine, @required this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> countRows = [];
  Map<int, List<String>> countTableMap = {};

  @override
  _OverhaulCountsPlan createState() => _OverhaulCountsPlan();
}

class _OverhaulCountsPlan extends State<OverhaulCountsPlan> {
  @override
  void initState() {
    super.initState();
    getTableRows();
  }

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
          widget.routine.name,
          style: BlackPawsAppBarTextStyle,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              // header Row
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  BlackPawsCircleAvatar(radius: 80.0),
                  SizedBox(
                    width: size.width * 0.125,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ConstTextField(
                          hintText: 'Bpm: ' + widget.countSheet.bpm.toString(),
                          onChanged: (String value) {
                            widget.countSheet.bpm = int.parse(value);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                          child: Container(
                            alignment: Alignment.center,
                            width: 300.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: BlackPawsColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0,
                                  ),
                                )),
                            child: Text(
                              '8 - Count bearbeitet',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: BlackPawsColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onPressed: () {
                            print('********************************');
                            widget.countSheet.skills = widget.countTableMap.toString();
                            DbInitiator.db.updateCountSheetObject(widget.countSheet);
                            DbInitiator.db.printAll(DbInitiator.TABLE_COUNT_SHEET_NAME);
                            print('********************************');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoutineStatus(
                                  routine: widget.routine,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              // table
              Table(
                border: TableBorder.all(color: BasicBlackColor, width: 2.0),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: widget.countRows,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getTableRows() async {
    Map<int, List<String>> oldValuesMap = {};
    final regex = RegExp(r'[^a-zA-Z,äÄöÖüÜ]+');
    String splitString = widget.countSheet.skills.replaceAll(regex, "");
    List<String> splitList = splitString.split(",");
    double rowCount = splitList.length / 8;
    int numberIndicator = rowCount.toInt();
    for (int i = 0; i < numberIndicator; i++) {
      oldValuesMap[i] = [];
      for (int j = 0; j < 8; j++) {
        oldValuesMap.values.elementAt(i).insert(j, "");
      }
    }
    int start = 0;
    int ende = 8;
    for (int key = 0; key < numberIndicator; key++) {
      oldValuesMap.update(key, (value) => splitList.sublist(start, ende));
      start = ende + 2;
      ende = ende + 10;
    }
    for (int i = 0; i < numberIndicator; i++) {
      widget.countTableMap[i] = [];
      for (int j = 0; j < 8; j++) {
        widget.countTableMap.values.elementAt(i).insert(j, "");
      }
      widget.countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(0, value);
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(0),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(1, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(2, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(2),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(3, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(3),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(4, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(4),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(5, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(5),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(6, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(6),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  widget.countTableMap.values.elementAt(i).insert(7, value.toString());
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(7).toString(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
