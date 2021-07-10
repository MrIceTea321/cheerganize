import 'package:Cheerganize/consts/container/AnimatedContainerCell.dart';
import 'package:Cheerganize/consts/CheerganizeCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/container/SmallRoundedContainer.dart';
import 'package:Cheerganize/consts/textFields/TableCellTextShowField.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/Skill.dart';
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
  int delayDuration = 7;

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
          title: Center(
            child: Text(
              widget.routine.name,
              style: CheerganizeAppBarTextStyle,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        CheerganizeCircleAvatar(radius: 80.0),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: CheerganizeYellowColor, width: 1.0),
                              left: BorderSide(
                                  color: CheerganizeYellowColor, width: 1.0),
                              right: BorderSide(
                                  color: CheerganizeYellowColor, width: 1.0),
                              bottom: BorderSide(
                                  color: CheerganizeYellowColor, width: 1.0),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
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
                                        style: CheerganizeAppBarTextStyle),
                                  ],
                                ),
                              );
                            },
                            // the Duration has to be the same as the
                            // delayValue in the AnimatedContainerClass
                            duration: Duration(seconds: widget.delayDuration),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Row(
                          children: [
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

    insertHeadCountHeader();

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
      widget.tableRows.insert(h+1, row);
      rowCounts.add(factorEight);
    }

    if (factorEight == widget.allElements - 8) {
      factorEight = 0;
    }
  }

  void insertHeadCountHeader() {
    widget.tableRows.insert(0,
      new TableRow(children: [
        TableCellTextShowField(hintText: '1'),
        TableCellTextShowField(hintText: '2'),
        TableCellTextShowField(hintText: '3'),
        TableCellTextShowField(hintText: '4'),
        TableCellTextShowField(hintText: '5'),
        TableCellTextShowField(hintText: '6'),
        TableCellTextShowField(hintText: '7'),
        TableCellTextShowField(hintText: '8'),
      ]),
    );
  }
}
