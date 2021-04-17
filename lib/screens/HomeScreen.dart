import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/buttons/HomeScreenButton.dart';
import 'package:cheerganize/consts/buttons/RoutineButton.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO insert drop down menu list
    //TODO make routines in drop down? or single page
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cheerganize",
          style: BlackPawsAppBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 40.0,
            color: Colors.white70,
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
                    HomeScreenButton(
                      text: 'Routines',
                      onPress: () {
                        Navigator.pushNamed(context, 'AllRoutines');
                      },
                    ),
                    HomeScreenButton(
                      text: 'Neue Routine',
                      onPress: () {
                        Navigator.pushNamed(context, 'NewRoutine');
                      },
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
}
