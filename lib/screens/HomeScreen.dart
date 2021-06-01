import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
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
        widthFactor: MediaQuery.of(context).size.width * 0.9,
        heightFactor: MediaQuery.of(context).size.height * 0.9,
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
                      onPress: () async {
                        List<Map<String, dynamic>> routines =
                            await getAllRoutines();
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

  static Future<List<Map<String, dynamic>>> getAllRoutines() async {
    return await DbInitiator.db.queryAllRows(DbInitiator.TABLE_ROUTINE_NAME);
  }

}
