import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/textFields/ConstTextField.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextOutputField.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skill.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulCountsPlan extends StatefulWidget {
  OverhaulCountsPlan(
      {@required this.routine,
      @required this.countSheet,
      @required this.oldValues});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];
  List<Skills> table = [];
  List<Skills> oldValues;
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
    getTableRowsNew(widget.numberIndicator, widget.tableRows, widget.table);
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
                            widget.countSheet.tableList = widget.table;
                            widget.countSheet.id = widget.routine.id;
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
                children: widget.tableRows,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getTableRowsNew(
      int numberIndicator, List<TableRow> tableRows, List<Skills> skillsList) {
    List<TextEditingController> controllerList =
        List.filled(numberIndicator * 8, new TextEditingController());
    List<String> stringList = [];
    skillsList = new List.generate(
        numberIndicator,
        (index) => new Skills.build(
            index.toString(),
            new List.generate(
                8, (index) => new Skill.build(index.toString(), ""))));
    widget.oldValues = widget.countSheet.tableList;
    for (int i = 0; i < numberIndicator; i++) {
      tableRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(0 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(0).setSkill(value);
                  stringList.insert(0 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(0)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(0)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(1 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(1).setSkill(value);
                  stringList.insert(1 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(1)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(1)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(2 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(2).setSkill(value);
                  stringList.insert(2 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(2)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(2)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(3 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(3).setSkill(value);
                  stringList.insert(3 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(3)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(3)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(4 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(4).setSkill(value);
                  stringList.insert(4 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(4)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(4)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(5 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(5).setSkill(value);
                  stringList.insert(5 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(5)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(5)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(6 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(6).setSkill(value);
                  stringList.insert(6 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(6)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(6)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                controller: controllerList.elementAt(7 * i),
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(7).setSkill(value);
                  stringList.insert(7 * i, value);
                },
                hintText: widget.oldValues
                    .elementAt(i)
                    .skillRow
                    .asMap()
                    .values
                    .elementAt(7)
                    .toString()
                    .substring(
                        14,
                        widget.oldValues
                                .elementAt(i)
                                .skillRow
                                .asMap()
                                .values
                                .elementAt(7)
                                .toString()
                                .characters
                                .length -
                            1),
              ),
            ),
          ],
        ),
      );
      stringList.add(controllerList.elementAt(0 * i).text);
      stringList.add(controllerList.elementAt(1 * i).text);
      stringList.add(controllerList.elementAt(2 * i).text);
      stringList.add(controllerList.elementAt(3 * i).text);
      stringList.add(controllerList.elementAt(4 * i).text);
      stringList.add(controllerList.elementAt(5 * i).text);
      stringList.add(controllerList.elementAt(6 * i).text);
      stringList.add(controllerList.elementAt(7 * i).text);
      widget.table =  skillsList;
      if (stringList.elementAt(0 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(0).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(0)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(0)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(1 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(1).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(1)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(1)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(2 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(2).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(2)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(2)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(3 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(3).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(3)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(3)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(4 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(4).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(4)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(4)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(5 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(5).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(5)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(5)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(6 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(6).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(6)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(6)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
      if (stringList.elementAt(7 * i) == '') {
        widget.table.elementAt(i).skillRow.elementAt(7).setSkill(
              widget.oldValues
                  .elementAt(i)
                  .skillRow
                  .asMap()
                  .values
                  .elementAt(7)
                  .toString()
                  .substring(
                      14,
                      widget.oldValues
                              .elementAt(i)
                              .skillRow
                              .asMap()
                              .values
                              .elementAt(7)
                              .toString()
                              .characters
                              .length -
                          1),
            );
      }
    }
  }
}
