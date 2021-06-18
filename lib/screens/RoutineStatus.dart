import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/RoutineButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:cheerganize/screens/OverhaulCountsPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OverhaulRoutine.dart';

class RoutineStatus extends StatefulWidget {
  final Routine routine;
  final CountSheet countSheet;

  const RoutineStatus(
      {Key key, @required this.routine, @required this.countSheet})
      : super(key: key);

  @override
  RoutineStatusState createState() => RoutineStatusState();
}

class RoutineStatusState extends State<RoutineStatus> {
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
            children: [
              BlackPawsCircleAvatar(radius: 125.0),
              SizedBox(height: 80.0),
              RoutineButton(
                text: '8 - Count bearbeiten',
                onPress: () {
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
        )));
  }

  void _delete() async {
    await DbInitiator.db
        .delete("routineid",widget.routine.routineid, DbInitiator
        .TABLE_ROUTINE_NAME);
    await DbInitiator.db.delete("countsheetid",widget.routine.countsheetid,
        DbInitiator.TABLE_COUNT_SHEET_NAME);
  }
}
