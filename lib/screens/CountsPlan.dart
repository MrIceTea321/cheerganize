import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextField.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skill.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountsPlan extends StatefulWidget {
  CountsPlan({this.routine, this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];
  List<Skills> table = [];
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
    widget.table =
        getTableRows(widget.numberIndicator, widget.tableRows, widget.table);
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
          widget.countSheet.name,
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
                        RoundedContainer(
                            prefix: 'Bpm: ',
                            suffix: widget.countSheet.bpm.toString()),
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
                            widget.countSheet.tableList = widget.table;
                            CountSheetDao().insert(widget.countSheet);
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
                children: widget.tableRows,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Skills> getTableRows(
      int numberIndicator, List<TableRow> countRows, List<Skills> skillsList) {
    skillsList = new List.generate(
        numberIndicator,
        (index) => new Skills.build(
            index.toString(),
            new List.generate(
                8, (index) => new Skill.build(index.toString(), ""))));

    for (int i = 0; i < numberIndicator; i++) {
      countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(0).setSkill(value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(1).setSkill(value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                skillsList.elementAt(i).skillRow.elementAt(2).setSkill(value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(3).setSkill(value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(4).setSkill(value);
                },
              ),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                skillsList.elementAt(i).skillRow.elementAt(5).setSkill(value);
              }),
            ),
            TableCell(
              child: TableCellTextField(onChanged: (String value) {
                skillsList.elementAt(i).skillRow.elementAt(6).setSkill(value);
              }),
            ),
            TableCell(
              child: TableCellTextField(
                onChanged: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(7).setSkill(value);
                },
              ),
            ),
          ],
        ),
      );
    }

    return skillsList;
  }
}
