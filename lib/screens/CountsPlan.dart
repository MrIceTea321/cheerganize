import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/NewRoutine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountsPlan extends StatefulWidget {
  CountsPlan({@required this.routineName, @required this.typeOfSport});

  String routineName;
  String typeOfSport;
  Routine routine;

  @override
  _CountsPlan createState() => _CountsPlan();
}

class _CountsPlan extends State<CountsPlan> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            BlackPawsCircleAvatar(radius: 100.0),
            SizedBox(height: 30.0),
            SizedBox(height: 30.0),
            BigFunctionButton(
              text: '8 - Counts Planung',
              //TODO find out why the routine objects doesent let me use his
              // setter methods
              onPress: () {
                widget.routine.name = widget.routineName;
                print(widget.routine.toJson());
                // DbInitiator.db.insert(
                 //   widget.routine.toMap(), DbInitiator.TABLE_ROUTINE_NAME);
                //DbInitiator.db.printALl(DbInitiator.TABLE_ROUTINE_NAME);
              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
          ],
        ),
      ),
    );
  }

  void setRoutineObject() {
    widget.routine.name = widget.routineName;
    widget.routine.typeofsport = widget.typeOfSport;
  }
}
