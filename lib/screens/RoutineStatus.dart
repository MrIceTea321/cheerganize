import 'package:Cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/RoutineButton.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/noSqlDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/noSqlDb/databaseObjects/Routine.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OverhaulCountsPlan.dart';
import 'OverhaulRoutine.dart';

class RoutineStatus extends StatefulWidget {
  final Routine routine;
  CountSheet countSheet;

  RoutineStatus({@required this.routine});

  @override
  RoutineStatusState createState() => RoutineStatusState();
}

class RoutineStatusState extends State<RoutineStatus> {
  @override
  void initState() {
    setUpCountSheetObject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AutoSizeText(
            widget.routine.name,
            textAlign: TextAlign.center,
            style: BlackPawsAppBarTextStyle,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: IconColorWhite,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'HomeScreen');
          },
        ),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent, size: 40),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  content: Text('Soll die aktuelle Routine wirklich gelöscht '
                      'werden?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Routine löschen'),
                      onPressed: () async {
                        _delete();
                        Navigator.pushNamed(context, 'HomeScreen');
                      },
                    ),
                  ],
                ),
                barrierDismissible: true,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlackPawsCircleAvatar(radius: 125.0),
              SizedBox(
                height: 60.0,
              ),
              RoutineButton(
                text: '8 - Count bearbeiten',
                onPress: () {
                  print('widget.countSheet after update for push');
                  print(widget.countSheet);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverhaulCountsPlan(
                        routine: widget.routine,
                        countSheet: widget.countSheet,
                      ),
                    ),
                  );
                },
              ),
              RoutineButton(
                text: 'Routine bearbeiten',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverhaulRoutine(
                                routine: widget.routine,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setUpCountSheetObject() async {
    print('countSheet name');
    print(widget.routine.name);
    widget.countSheet =
        await CountSheetDao().getCountSheet(widget.routine.name);
    print('********** setup countsheet **************');
    print(widget.countSheet.tableList);
  }

  void _delete() async {
    CountSheetDao().delete(widget.countSheet);
    RoutineDao().delete(widget.routine);
  }
}
