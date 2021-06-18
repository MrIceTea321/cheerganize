import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/consts/TableCellTextOutputField.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'RoutineStatus.dart';

class OverhaulCountsPlan extends StatefulWidget {
  OverhaulCountsPlan({@required this.routine, @required this.countSheet});

  CountSheet countSheet;
  Routine routine;
  final List<TableRow> tableRows = [];

  @override
  _OverhaulCountsPlan createState() => _OverhaulCountsPlan();
}

class _OverhaulCountsPlan extends State<OverhaulCountsPlan> {
  @override
  void initState() {
    super.initState();

    //var split = countSheet.skills.split("([0-9]|[1-9][0-9]|[1-9][0-9][0-9])");
  }

  @override
  Widget build(BuildContext context) {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoutineStatus(
                                  routine: widget.routine,
                                  countSheet: widget.countSheet,
                                ),
                              ),
                            );
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
}
