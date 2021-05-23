import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/RoutineButton.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RoutineStatus.dart';

class AllRoutines extends StatefulWidget {
  final List<Map<String, dynamic>> routines;

  const AllRoutines({this.routines});

  @override
  _AllRoutines createState() => _AllRoutines();
}

class _AllRoutines extends State<AllRoutines> {
int routineNameIndex = 5;
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
          children: [
            SizedBox(
              height: 20.0,
            ),
            BlackPawsCircleAvatar(
              radius: 100.0,
            ),
            SizedBox(
              height: 40.0,
              width: 325.0,
              child: Divider(
                thickness: 0.5,
                color: BlackPawsColor,
              ),
            ),
            Expanded(
              child: Scrollbar(
                thickness: 5.5,
                child: new ListView.builder(
                    itemCount: widget.routines.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return RoutineButton(
                          text: widget.routines.elementAt(index).entries
                              .elementAt(routineNameIndex).value,
                          onPress: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoutineStatus(routines:
                                    widget.routines.elementAt(index))));
                      },);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
