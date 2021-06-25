import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/ConstTextField.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/TableCellTextOutputField.dart';
import 'package:Cheerganize/consts/TableCellTextShowField.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skill.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCountsPlan extends StatefulWidget {
  ShowCountsPlan(
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
  _ShowCountsPlan createState() => _ShowCountsPlan();
}

class _ShowCountsPlan extends State<ShowCountsPlan> {
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
                        RoundedContainer(
                            prefix: 'Bpm: ',
                            suffix: widget.countSheet.bpm.toString()),
                        SizedBox(
                          height: 10.0,
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
              child: TableCellTextShowField(
                controller: controllerZero,
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
              child: TableCellTextShowField(
                controller: controllerOne,
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
              child: TableCellTextShowField(
                controller: controllerTwo,
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
              child: TableCellTextShowField(
                controller: controllerThree,
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
              child: TableCellTextShowField(
                controller: controllerFour,
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
              child: TableCellTextShowField(
                controller: controllerFive,
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
              child: TableCellTextShowField(
                controller: controllerSix,
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
              child: TableCellTextShowField(
                controller: controllerSeven,
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
