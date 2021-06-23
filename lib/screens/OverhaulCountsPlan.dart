import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/RoundedContainer.dart';
import 'package:cheerganize/consts/TableCellTextOutputField.dart';
import 'package:cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulCountsPlan extends StatefulWidget {
  OverhaulCountsPlan({@required this.routine, @required this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  final List<TableRow> countRows = [];
  final Map<int, List<String>> countTableMap = {};
  Map<int, List<String>> table = {};

  int numberIndicator;

  @override
  _OverhaulCountsPlan createState() => _OverhaulCountsPlan();
}

class _OverhaulCountsPlan extends State<OverhaulCountsPlan> {
  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    widget.numberIndicator = rows.toInt();
    widget.table = getTableRows(widget.numberIndicator, widget.countTableMap);
  }

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
                        RoundedContainer(
                            prefix: 'Anzahl der Reihen: ',
                            suffix: widget.numberIndicator.toString()),
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
                            widget.countSheet.skills = widget.table;
                            CountSheetDao().update(widget.countSheet);
                            Navigator.pushNamed(context, "HomeScreen");
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

  Map<int, List<String>> getTableRows(
      int numberIndicator, Map<int, List<String>> countTableMap) {
    Map<int, List<String>> oldValuesMap = {};

    for (int i = 0; i < numberIndicator; i++) {
      countTableMap[i] = [];
      for (int j = 0; j < 8; j++) {
        countTableMap.values.elementAt(i).insert(j, "");
      }
      widget.countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value == "") {
                    countTableMap.values.elementAt(i).insert(
                        0, oldValuesMap.values.elementAt(i).elementAt(0));
                  } else {
                    countTableMap.values.elementAt(i).insert(0, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(0),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        1, oldValuesMap.values.elementAt(i).elementAt(1));
                  } else {
                    countTableMap.values.elementAt(i).insert(1, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        2, oldValuesMap.values.elementAt(i).elementAt(2));
                  } else {
                    countTableMap.values.elementAt(i).insert(2, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(2),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        3, oldValuesMap.values.elementAt(i).elementAt(3));
                  } else {
                    countTableMap.values.elementAt(i).insert(3, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(3),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        4, oldValuesMap.values.elementAt(i).elementAt(4));
                  } else {
                    countTableMap.values.elementAt(i).insert(4, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(4),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        5, oldValuesMap.values.elementAt(i).elementAt(5));
                  } else {
                    countTableMap.values.elementAt(i).insert(5, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(5),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        6, oldValuesMap.values.elementAt(i).elementAt(6));
                  } else {
                    widget.countTableMap.values.elementAt(i).insert(6, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(6),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  if (value.isEmpty) {
                    countTableMap.values.elementAt(i).insert(
                        7, oldValuesMap.values.elementAt(i).elementAt(7));
                  } else {
                    countTableMap.values.elementAt(i).insert(7, value);
                  }
                },
                hintText: oldValuesMap.values.elementAt(i).elementAt(7),
              ),
            ),
          ],
        ),
      );
    }
    return countTableMap;
  }
}
