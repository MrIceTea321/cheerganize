import 'package:Cheerganize/consts/CheerganizeCircleAvatar.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:Cheerganize/sembastDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AllRoutines.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Cheerganize",
            style: CheerganizeAppBarTextStyle,
          ),
        ),
        actions: <Widget>[],
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
              ),
              CheerganizeCircleAvatar(
                radius: 150.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigFunctionButton(
                      text: 'Routines',
                      onPress: () async {
                        List<Routine> routines =
                            await RoutineDao().getAllSortedByName();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllRoutines(
                              routines: routines,
                            ),
                          ),
                        );
                      },
                      marginLTRB: [10.0, 10.0, 10.0, 10.0],
                    ),
                    BigFunctionButton(
                        text: 'Neue Routine',
                        onPress: () {
                          Navigator.pushNamed(context, 'NewRoutine');
                        },
                        marginLTRB: [10.0, 10.0, 10.0, 10.0]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
