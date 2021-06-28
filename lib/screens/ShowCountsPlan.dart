import 'dart:async';

import 'package:Cheerganize/consts/container/AnimatedContainer.dart';
import 'package:Cheerganize/consts/CheerganizeCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/container/RoundedContainer.dart';
import 'package:Cheerganize/consts/buttons/StartAnimationButton.dart';
import 'package:Cheerganize/consts/container/SmallRoundedContainer.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextShowField.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Skill.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
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
                        Container(
                          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          decoration: BoxDecoration(
                              border: Border(
                            top: BorderSide(color: CheerganizeYellowColor, width: 1.0),
                            left: BorderSide(color: CheerganizeYellowColor, width: 1.0),
                            right:
                                BorderSide(color: CheerganizeYellowColor, width: 1.0),
                            bottom:
                                BorderSide(color: CheerganizeYellowColor, width: 1.0),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
                          child: Countdown(
                            builder:
                                (BuildContext context, Duration remaining) {
                              return Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Der 8 - Count startet in',
                                      style: CheerganizePlayCountTextStyle,
                                    ),
                                    Text('${remaining.inSeconds} Sekunden',
                                        style: BlackPawsAppBarTextStyle)
                                  ],
                                ),
                              );
                            },
                            // duration has to be the same as the delayValue in
                            // the AnimatedContainerClass
                            duration: Duration(seconds: 7),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0,
                            ),
                            Column(
                              children: [
                                SmallRoundedContainer(
                                  prefix: 'Anzahl der Reihen: ',
                                  suffix: widget.numberOfRows.toString(),
                                ),
                                SmallRoundedContainer(
                                  prefix: 'Bpm: ',
                                  suffix: widget.countSheet.bpm.toString(),
                                ),
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
                  border: TableBorder.all(color: BasicBlackColor, width: 0.5),
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
        widget.tableCellList.insert(
          i + rowCounts.elementAt(h),
          new AnimatedContainerCell(
            durationInMillSec:
                durations.elementAt(i + 1 + rowCounts.elementAt(h)),
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
