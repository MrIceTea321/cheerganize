import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/FormationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulCountsPlan extends StatefulWidget {
  OverhaulCountsPlan({this.routine, this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];

  @override
  _OverhaulCountsPlan createState() => _OverhaulCountsPlan();
}

class _OverhaulCountsPlan extends State<OverhaulCountsPlan> {
  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    int numberIndicator = rows.toInt();
    setupTableRows(numberIndicator, widget.tableRows);
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
                          onPressed: () {
                            DbInitiator.db.insert(widget.countSheet
                                .toMapWithoutId(),  DbInitiator.TABLE_COUNT_SHEET_NAME);
                            DbInitiator.db.printALl(DbInitiator.TABLE_COUNT_SHEET_NAME);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormationScreen(
                                  routine: widget.routine,
                                  countSheet: widget.countSheet,
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
                children: widget.tableRows,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setupTableRows(int numberIndicator, List<TableRow> countRows) {
    widget.countSheet.skills = {};
    for (int i = 0; i < numberIndicator; i++) {
      widget.countSheet.skills[i] = [];
      widget.countSheet.skills.values.elementAt(i).insert(0, "");
      widget.countSheet.skills.values.elementAt(i).insert(1, "");
      widget.countSheet.skills.values.elementAt(i).insert(2, "");
      widget.countSheet.skills.values.elementAt(i).insert(3, "");
      widget.countSheet.skills.values.elementAt(i).insert(4, "");
      widget.countSheet.skills.values.elementAt(i).insert(5, "");
      widget.countSheet.skills.values.elementAt(i).insert(6, "");
      widget.countSheet.skills.values.elementAt(i).insert(7, "");

      countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextField(
                onSubmitted: (String value) {
                  widget.countSheet.skills.values.elementAt(i).insert(0, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onSubmitted: (String value) {
                  widget.countSheet.skills.values.elementAt(i).insert(1, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onSubmitted: (String value) {
                widget.countSheet.skills.values.elementAt(i).insert(2, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onSubmitted: (String value) {
                  widget.countSheet.skills.values.elementAt(i).insert(3, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onSubmitted: (String value) {
                  widget.countSheet.skills.values.elementAt(i).insert(4, value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onSubmitted: (String value) {
                widget.countSheet.skills.values.elementAt(i).insert(5, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(onSubmitted: (String value) {
                widget.countSheet.skills.values.elementAt(i).insert(6, value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onSubmitted: (String value) {
                  widget.countSheet.skills.values.elementAt(i).insert(7,
                      value);
                },
              ),
            ),
          ],
        ),
      );
    }
  }