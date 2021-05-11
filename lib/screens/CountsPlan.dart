import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/screens/NewRoutine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountsPlan extends StatefulWidget {
  String eingabe;

  String get getEingabe => eingabe;

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
            ConstTextField(
              hintText: 'Name der Routine',
              onSubmitted: (value) {
                widget.eingabe = value;
              },
            ),
            ConstTextField(
              hintText: 'Kategorie / Sportart',
              onSubmitted: (value) {
                widget.eingabe = value;
              },
            ),
            SizedBox(height: 30.0),
            BigFunctionButton(
              text: '8 - Counts Planung',
              onPress: () {

              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
          ],
        ),)
      ,
    );
  }
}