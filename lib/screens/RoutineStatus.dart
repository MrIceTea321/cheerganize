import 'package:Cheerganize/consts/CheerganizeCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/RoutineButton.dart';
import 'package:Cheerganize/sembastDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/sembastDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/Routine.dart';
import 'package:Cheerganize/screens/ShowCountsPlan.dart';
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
            style: CheerganizeAppBarTextStyle,
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
              CheerganizeCircleAvatar(radius: 125.0),
              SizedBox(
                height: 60.0,
              ),
              RoutineButton(
                text: '8 - Count anzeigen',
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      content: Text(
                        'Auf der nächsten Seite startet der 8 - '
                        'Count automatisch nachdem der Counter, welcher auf'
                        ' der Seite oben mittig zu sehen ist, auf 0 steht'
                        '.',
                        style: TextStyle(
                          color: BasicBlackColor,
                          fontSize: 24.0,
                          fontFamily: 'Antonio-VariableFont',
                        ),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('zum 8 - Count',
                              style: TextStyle(
                                color: BasicBlackColor,
                                fontSize: 32.0,
                                fontFamily: 'Antonio-VariableFont',
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowCountsPlan(
                                  routine: widget.routine,
                                  countSheet: widget.countSheet,
                                  oldValues: widget.countSheet.tableList,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    barrierDismissible: true,
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
              RoutineButton(
                text: '8 - Count bearbeiten',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverhaulCountsPlan(
                        routine: widget.routine,
                        countSheet: widget.countSheet,
                        oldValues: widget.countSheet.tableList,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setUpCountSheetObject() async {
    widget.countSheet =
        await CountSheetDao().getCountSheetById(widget.routine.id);
  }

  void _delete() async {
    CountSheetDao().delete(widget.routine.id);
    RoutineDao().delete(widget.routine);
  }
}
