import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/ConstTextField.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/TableCellTextOutputField.dart';
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
  String helperZero = '';
  String helperOne = '';
      String helperTwo ='';
  String helperThree = '';
  String helperFour = '';
  String helperFive = '';
  String helperSix = '';
      String helperSeven = '';

  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    widget.numberIndicator = rows.toInt();
    widget.table =
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
                            setupTableObjectOverhauled();
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

  List<Skills> getTableRowsNew(
      int numberIndicator, List<TableRow> countRows, List<Skills> skillsList) {
    skillsList = new List.generate(
        numberIndicator,
        (index) => new Skills.build(
            index.toString(),
            new List.generate(
                8, (index) => new Skill.build(index.toString(), ""))));

    widget.oldValues = widget.countSheet.tableList;
    for (int i = 0; i < numberIndicator; i++) {
        TextEditingController controllerZero = new TextEditingController();
        TextEditingController controllerOne = new TextEditingController();
        TextEditingController controllerTwo = new TextEditingController();
        TextEditingController controllerThree = new TextEditingController();
        TextEditingController controllerFour = new TextEditingController();
        TextEditingController controllerFive = new TextEditingController();
        TextEditingController controllerSix = new TextEditingController();
        TextEditingController controllerSeven = new TextEditingController();

        helperZero = controllerZero.text;
        helperOne = controllerOne.text;
        helperTwo = controllerTwo.text;
        helperThree = controllerThree.text;
        helperFour = controllerFour.text;
        helperFive = controllerFive.text;
        helperSix = controllerSix.text;
        helperSeven = controllerSeven.text;

        countRows.add(
          TableRow(
            children: <Widget>[
              TableCell(
                child: TableCellTextOutputField(
                  controller: controllerZero,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(0)
                        .setSkill(value);
                    helperZero = value;
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
                  controller: controllerOne,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(1)
                        .setSkill(value);
                    helperOne = value;
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
                  controller: controllerTwo,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(2)
                        .setSkill(value);
                    helperTwo = value;
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
                  controller: controllerThree,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(3)
                        .setSkill(value);
                    helperThree = value;
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
                  controller: controllerFour,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(4)
                        .setSkill(value);
                    helperFour = value;
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
                  controller: controllerFive,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(5)
                        .setSkill(value);
                    helperFive = value;
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
                  controller: controllerSix,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(6)
                        .setSkill(value);
                    helperSix = value;
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
                  controller: controllerSeven,
                  onSubmitted: (String value) {
                    skillsList
                        .elementAt(i)
                        .skillRow
                        .elementAt(7)
                        .setSkill(value);
                    helperSeven = value;
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
    }
    return skillsList;
  }

  void setupTableObjectOverhauled() {

    for (int i = 0; i < widget.numberIndicator; i++) {
      if (helperZero == '') {
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
      if (helperOne == '') {
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
      if (helperTwo == '') {
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
      if (helperThree == '') {
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
      if (helperFour == '') {
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
      if (helperFive == '') {
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
      if (helperSix == '') {
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
      if (helperSeven == '') {
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
