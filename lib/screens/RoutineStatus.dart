import 'package:auto_size_text/auto_size_text.dart';
import 'package:cheerganize/consts/buttons/RoutineButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/AllRoutines.dart';
import 'package:cheerganize/screens/CountsPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OverhaulRoutine.dart';

class RoutineStatus extends StatefulWidget {
  final Routine routine;

  const RoutineStatus({Key key, @required this.routine}) : super(key: key);
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
              minFontSize: 6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, 'AllRoutines');
            },
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 35),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          content: Text(
                              'Soll die aktuelle Routine wirklich gelöscht '
                              'werden?'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Routine löschen'),
                              onPressed: () async {
                                await _loeschen();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllRoutines()));
                              },
                            ),
                          ],
                        ),
                    barrierDismissible: true);
              },
            ),
          ]),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: RoutineButton(
                text: 'Zur Routine',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CountsPlan(routine: widget.routine)));
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: RoutineButton(
                text: 'Bearbeiten',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverhaulRoutine(
                                routine: widget.routine,
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loeschen() async {
    print(widget.routine.routineid);
    await DbInitiator.db.delete(widget.routine.routineid,
        DbInitiator.TABLE_ROUTINE_NAME, widget.routine.name);
  }
}
