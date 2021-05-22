import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AllRoutines.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int rowCount;

  @override
  Widget build(BuildContext context) {
    //TODO insert drop down menu list
    //TODO make routines in drop down? or single page
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cheerganize",
          style: BlackPawsAppBarTextStyle,
        ),
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
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              BlackPawsCircleAvatar(
                radius: 125.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigFunctionButton(
                      text: 'Routines',
                      onPress: () {
                        setRowCount();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              AllRoutines(rowCount: rowCount,),
                          ),);
                      },
                      marginLTRB: [10.0, 10.0, 10.0, 10.0],
                    ),
                    BigFunctionButton(
                        text: 'Neue Routine',
                        onPress: () {
                          Navigator.pushNamed(context, 'NewRoutine');
                        },
                        marginLTRB: [10.0, 10.0, 10.0, 10.0]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setRowCount() async {
    rowCount =
    await DbInitiator.db.queryRowCount(DbInitiator.TABLE_ROUTINE_NAME);
    print(rowCount);
  }
}
