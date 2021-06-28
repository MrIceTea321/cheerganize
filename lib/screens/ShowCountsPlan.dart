import 'dart:async';

import 'package:Cheerganize/consts/AnimatedContainer.dart';
import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/StartAnimationButton.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextShowField.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skill.dart';
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
  List<Skill> skillList;
  List<Skill> oldValues;
  List<String> stringList = [];
  List<AnimatedContainerCell> tableCellList = [];
  List<AnimationController> animationControllerList;
  int numberOfRows;
  int allElements;
  int durationPerCellInMilSec;

  @override
  _ShowCountsPlan createState() => _ShowCountsPlan();
}

class _ShowCountsPlan extends State<ShowCountsPlan>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    widget.numberOfRows = rows.toInt();
    widget.allElements = widget.numberOfRows * 8;
    widget.durationPerCellInMilSec =
        ((widget.countSheet.bpm / widget.allElements) * 1000.0).toInt();
    setupTableRowsOverhaul();
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
              widget.animationControllerList.forEach(
                (controller) {
                  controller.dispose();
                },
              );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        BlackPawsCircleAvatar(radius: 80.0),
                        SizedBox(
                          width: 100.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20.00,
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Column(
                              children: [
                                Text(
                                    'Anzahl der Reihen: ' +
                                        widget.numberOfRows.toString(),
                                    style: BlackPawsPlayCountTextStyle),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text('Bpm: ' + widget.countSheet.bpm.toString(),
                                    style: BlackPawsPlayCountTextStyle),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Table(
                  border: TableBorder.all(color: BasicBlackColor, width: 2.0),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: widget.tableRows,
                ),
              ],
            ),
          ],
        ));
  }

  void setupTableRowsOverhaul() {
    widget.skillList = new List.generate(
        widget.allElements, (index) => new Skill.build(index.toString(), ''));

    List<int> durations = new List.generate(widget.allElements + 1,
        (index) => widget.durationPerCellInMilSec * index);

    widget.oldValues = widget.countSheet.tableList;

    List<int> rowCounts = [];
    int factorEight = 0;
    rowCounts.add(factorEight);

    for (int h = 0; h < widget.numberOfRows; h++) {
      TableRow row = new TableRow(children: []);

      for (int i = 0; i <= 7; i++) {
        widget.tableCellList.insert(i + rowCounts.elementAt(h),
          new AnimatedContainerCell(
              durationInMillSec: durations.elementAt(i+1+ rowCounts.elementAt
                (h)),
                hintText: widget.oldValues
                .elementAt(i + rowCounts.elementAt(h))
                .getSkill(),
          ),
        );
        row.children.insert(
            i, widget.tableCellList.elementAt(i + rowCounts.elementAt(h)));
      }
      if (factorEight < widget.allElements - 8) {
        factorEight = factorEight + 8;
      }
      widget.tableRows.insert(h, row);
      rowCounts.add(factorEight);
    }

    if (factorEight == widget.allElements - 8) {
      factorEight = 0;
    }
  }
}
