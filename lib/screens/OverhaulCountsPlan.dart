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
  OverhaulCountsPlan({@required this.routine, @required this.countSheet});

  final Routine routine;
  final CountSheet countSheet;
  List<TableRow> tableRows = [];
  List<Skills> table = [];
  List<Skills> oldTable;
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
                          onPressed: () async {
                            widget.countSheet.tableList = await getTableRows(
                                widget.numberIndicator,
                                widget.tableRows,
                                widget.table,
                                widget.oldTable);
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

  Future<List<Skills>> getTableRows(
      int numberIndicator,
      List<TableRow> countRows,
      List<Skills> skillsList,
      List<Skills> oldValues) async {
    CountSheet oldSheet =
        await CountSheetDao().getCountSheet(widget.routine.name);
    oldValues = oldSheet.tableList;
    skillsList = new List.generate(
        numberIndicator,
        (index) => new Skills.build(
            index.toString(),
            new List.generate(
                8, (index) => new Skill.build(index.toString(), ""))));

    oldValues = widget.countSheet.tableList;
    for (int i = 0; i < numberIndicator; i++) {
      countRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(0).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(0).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(1).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(1).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(2).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(2).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(3).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(3).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(4).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(4).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(5).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(5).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(6).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(6).skill,
              ),
            ),
            TableCell(
              child: TableCellTextOutputField(
                onSubmitted: (String value) {
                  skillsList.elementAt(i).skillRow.elementAt(7).setSkill(value);
                },
                hintText: oldValues.elementAt(i).skillRow.elementAt(7).skill,
              ),
            ),
          ],
        ),
      );
    }
    return skillsList;
  }
}
