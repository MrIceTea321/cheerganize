import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/FormationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountsPlan extends StatefulWidget {
  CountsPlan({this.routine});

  final Routine routine;

  @override
  _CountsPlan createState() => _CountsPlan();
}

class _CountsPlan extends State<CountsPlan> {
  @override
  Widget build(BuildContext context) {
    List<String> skills = new List();
    int bpm;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            iconSize: 40.0,
            color: IconColorWhite,
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, 'Settings');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.home),
          color: IconColorWhite,
          iconSize: 40.0,
          onPressed: () {
            Navigator.pushNamed(context, 'HomeScreen');
          },
        ),
        title: Text(
          "Cheerganize",
          style: BlackPawsAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: size.width * 0.15,),
                  BlackPawsCircleAvatar(radius: 80.0),
                  SizedBox(width: size.width * 0.125,),
                  Expanded(
                    child: Column(
                      children: [
                        ConstTextField(
                          hintText: 'bpm',
                          onSubmitted: (value) {
                            bpm = value;
                          },
                        ),
                        TextButton(
                          child: Container(
                            alignment: Alignment.center,
                            width: 300.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: BlackPawsColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0,
                                  ),
                                )),
                            child: Text(
                              '8 - Count anlegen',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: BlackPawsColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onPressed: () {
                            CountSheet sheet = buildCountSheetObject(skills, bpm);
                            DbInitiator.db.insert(
                                sheet.toMap(), DbInitiator.TABLE_COUNT_SHEET_NAME);
                            DbInitiator.db
                                .printALl(DbInitiator.TABLE_COUNT_SHEET_NAME);
                            DbInitiator.db.printALl(DbInitiator.TABLE_ROUTINE_NAME);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormationScreen(
                                      routine: widget.routine,
                                      countSheet: sheet,
                                    )));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.15,)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0),
                  SizedBox(height: 20.0),
                  Table(
                    border:
                    TableBorder.all(color: BasicBlackColor, width: 2.0),
                    defaultVerticalAlignment:
                    TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(0, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(1, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(2, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(3, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(4, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(5, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(6, value);
                              },
                            ),
                          ),
                          TableCell(
                            child: TableCellTextField(
                              onSubmitted: (String value) {
                                skills.insert(7, value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CountSheet buildCountSheetObject(List<String> skills, int bpm) {
    CountSheet sheet = new CountSheet(skills, bpm);
    widget.routine.countsheetid = sheet.countsheetid;
    return sheet;
  }
}
