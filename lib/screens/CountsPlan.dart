import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CountsPlan extends StatefulWidget {
  CountsPlan({this.routine, this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];
  Map<int, List<String>> table = {};
  int numberIndicator;

  @override
  _CountsPlan createState() => _CountsPlan();
}

class _CountsPlan extends State<CountsPlan> {
  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    widget.numberIndicator = rows.toInt();
    widget.table = getTableRows(widget.numberIndicator, widget.tableRows,widget.table);
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
          widget.countSheet.label,
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
                        Container(
                          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: BlackPawsTextFieldTextStyle,
                            decoration: InputDecoration(
                              hintText: 'Anzahl der Reihen: ' +
                                  widget.numberIndicator.toString(),
                              hintStyle: BlackPawsTextFieldTextStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: BlackPawsColor, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: BlackPawsColor, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Bpm: ' + widget.countSheet.bpm.toString(),
                          style: BlackPawsTextFieldTextStyle,
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
                              '8 - Count anlegen',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: BlackPawsColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            print('angelegter CountsPlan als String');
                            widget.countSheet.skills = widget.table.toString();
                            print(widget.countSheet.skills);
                            DbInitiator.db.updateCountSheetObject(widget.countSheet);
                            DbInitiator.db.printAll(DbInitiator.TABLE_COUNT_SHEET_NAME);
                            Navigator.pushNamed(context,"HomeScreen");
                          
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
                children: widget.tableRows,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<int, List<String>> getTableRows(int numberIndicator,
      List<TableRow> countRows,Map<int, List<String>> countTableMap) {
    for (int i = 0; i < numberIndicator; i++) {
      countTableMap[i] = [];
      for (int j = 0; j < 8; j++) {
        countTableMap.values.elementAt(i).insert(j, "");
      }
      countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  countTableMap.values.elementAt(i).insert(0, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  countTableMap.values.elementAt(i).insert(1, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                countTableMap.values.elementAt(i).insert(2, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  countTableMap.values.elementAt(i).insert(3, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  countTableMap.values.elementAt(i).insert(4, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                countTableMap.values.elementAt(i).insert(5, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                countTableMap.values.elementAt(i).insert(6, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  countTableMap.values.elementAt(i).insert(7, value);
                },
              ),
            ),
          ],
        ),
      );
    }
    return countTableMap;
    
  }
}
