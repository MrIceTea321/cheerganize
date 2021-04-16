import 'package:cheerganize/consts/buttons/RoutineButton.dart';
import 'package:cheerganize/consts/buttons/TextStyles.dart';
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
            style: RoutineButtonTextStyle,
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 40.0,
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, 'Settings');
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'images/logoRemovedBackground.png',
                alignment: AlignmentDirectional.topCenter,
              ),
              Expanded(
                child: new ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext contex, index) {
                    return RoutineButton(
                      text: 'Routine',
                      onPress: () {
                        Navigator.pushNamed(context, 'NewRoutine');
                        //TODO insert different Routines (maybe steal code from
                        //TODO studycards project - but refactor first)
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
