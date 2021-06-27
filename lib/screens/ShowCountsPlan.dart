import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:Cheerganize/consts/buttons/StartAnimationButton.dart';
import 'package:Cheerganize/consts/textFields/ConstTextField.dart';
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
  ShowCountsPlan({@required this.routine,
    @required this.countSheet,
    @required this.oldValues});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];
  List<Skill> skillList;
  List<Skill> oldValues;
  List<String> stringList = [];
  List<TableCellTextShowField> tableCellList = [];
  int numberIndicator;
  int allElements;
  Color color;

  @override
  _ShowCountsPlan createState() => _ShowCountsPlan();
}

class _ShowCountsPlan extends State<ShowCountsPlan> {
  @override
  void initState() {
    super.initState();
    var rows = (widget.countSheet.bpm * widget.countSheet.duration) / 8.0;
    widget.numberIndicator = rows.toInt();
    widget.allElements = widget.numberIndicator * 8;
    setupTableRowsOverhaul();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                  children: [
                    Row(
                      children: [
                        BlackPawsCircleAvatar(radius: 80.0),
                        Column(
                            children: [
                            SizedBox(height: 20.00,),
                              Row(
                                children: [
                                  Text(
                                      '8 - Count starte', style: BlackPawsTextFieldTextStyle,),
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
                              SizedBox(height: 20.0,),
                              Text('Anzahl der Reihen: ' + widget
                                  .numberIndicator.toString(), style: BlackPawsTextFieldTextStyle),
                              Text(
                                  'Bpm: ' + widget.countSheet.bpm.toString(),
                                  style: BlackPawsTextFieldTextStyle),
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
                  border:
                  TableBorder.all(color: BasicBlackColor, width: 2.0),
                  defaultVerticalAlignment:
                  TableCellVerticalAlignment.middle,
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

    widget.oldValues = widget.countSheet.tableList;
    print(widget.oldValues);
    List<int> helperValues = [];
    int helper = 0;
    helperValues.add(helper);

    for (int h = 0; h < widget.numberIndicator; h++) {
      TableRow row = new TableRow(children: []);
      for (int i = 0; i <= 7; i++) {
        widget.tableCellList.insert(
          i + helperValues.elementAt(h),
          new TableCellTextShowField(
            hintText: widget.oldValues
                .elementAt(i + helperValues.elementAt(h))
                .getSkill(),
            durationInSeconds:1,
            color: widget.color,
          ),
        );
        row.children.insert(
            i, widget.tableCellList.elementAt(i + helperValues.elementAt(h)));
      }
      if (helper < widget.allElements - 8) {
        helper = helper + 8;
      }
      widget.tableRows.insert(h, row);
      helperValues.add(helper);
    }
    if (helper == widget.allElements - 8) {
      helper = 0;
    }
  }
}
