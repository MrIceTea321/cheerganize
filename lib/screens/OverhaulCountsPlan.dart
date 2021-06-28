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
  List<Skill> skillList = [];
  List<Skill> oldValues;
  List<TableCellTextOutputField> tableCellList = [];
  int numberIndicator;
  int allElements;

  @override
  _OverhaulCountsPlan createState() => _OverhaulCountsPlan();
}

class _OverhaulCountsPlan extends State<OverhaulCountsPlan> {
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
                            widget.countSheet.tableList = widget.skillList;
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

  void setupTableRowsOverhaul() {

    List<int> helperList = [];
    List<TextEditingController> controllerList = List.filled(widget.allElements, new TextEditingController());

    widget.skillList = new List.generate(widget.numberIndicator,
        (index) => new Skill.build(index.toString(), ''));

    widget.oldValues = widget.countSheet.tableList;

    int helper = 0;
    helperList.add(helper);
    for (int h = 0; h < widget.numberIndicator; h++) {
      TableRow row = new TableRow(children: []);
      for (int i = 0; i <= 7; i++) {
        widget.tableCellList.insert(i+helperList
            .elementAt(h), new TableCellTextOutputField(
            onSubmitted: (String value) {
              widget.skillList.elementAt(i+helperList
                  .elementAt(h)).setSkill(value);
              controllerList.elementAt(i+helperList
                  .elementAt(h)).clear();
              widget.oldValues.elementAt(i+helperList
                  .elementAt(h)).setSkill(value);
            },
            hintText: widget.oldValues.elementAt(i+helperList
                .elementAt(h)).getSkill(),
            controller: controllerList.elementAt(i+helperList
                .elementAt(h)),
          ),
        );
        row.children.insert(i, widget.tableCellList.elementAt(i + helperList
            .elementAt(h)));

        if (controllerList.elementAt(i + helperList.elementAt(h)).text == '') {
          widget.skillList.insert(i + helperList
              .elementAt(h), widget.oldValues.elementAt(i +
              helperList
                  .elementAt(h)));
        }
      }
      if (helper < widget.allElements) {
        helper = helper + 8;
      }
      helperList.add(helper);
      widget.tableRows.insert(h, row);
      if (helper == widget.allElements - 8) {
        helper = 0;
      }
    }
  }
}
