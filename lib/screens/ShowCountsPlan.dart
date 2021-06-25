import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/buttons/StartAnimationButton.dart';
import 'package:Cheerganize/consts/textFields/ConstTextField.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextOutputField.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextShowField.dart';
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
  Color color;

  @override
  _ShowCountsPlan createState() => _ShowCountsPlan();
}

class _ShowCountsPlan extends State<ShowCountsPlan> {
  @override
  void initState() {
    super.initState();
    widget.color = BlackPawsColor;
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
                        Row(
                          children: [
                            RoundedContainer(prefix: '8 - Count', suffix: ''),
                            StartAnimationButton(
                              onPressed: () {
                                print('Button Pressed');
                                setState(
                                  () {
                                    widget.color = Colors.red;
                                    print(widget.color.toString());
                                  },
                                );
                              },
                            ),
                          ],
                        ),
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
    TableRow row;
    skillsList = new List.generate(
        numberIndicator,
        (index) => new Skills.build(
            index.toString(),
            new List.generate(
                8, (index) => new Skill.build(index.toString(), ""))));

    widget.oldValues = widget.countSheet.tableList;
    for (int i = 0; i < numberIndicator; i++) {
      countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextShowField(
                color: widget.color,
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
                durationInSeconds: 10,
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
}
