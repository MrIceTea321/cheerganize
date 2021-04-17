import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/HomeScreenButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  @override
  _NewRoutine createState() => _NewRoutine();
}

class _NewRoutine extends State<NewRoutine> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlackPawsCircleAvatar(radius: 100.0),
            ConstTextField(hintText: 'Name der Routine'),
            ConstTextField(hintText: 'Kategorie / Sportart'),
            HomeScreenButton(text: 'Neue Aufstellung', onPress: (){}),
            HomeScreenButton(text: "8 - Counts Planung", onPress: (){}),

          ],
        ),
      ),
    );
  }
}
