import 'package:cheerganize/consts/BlackPawsCircleAvatar.dart';
import 'package:cheerganize/consts/ConstTextField.dart';
import 'package:cheerganize/consts/Constants.dart';
import 'package:cheerganize/consts/TableCellTextField.dart';
import 'package:cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:cheerganize/database/DbInitiator.dart';
import 'package:cheerganize/database/databaseObjects/CountSheet.dart';
import 'package:cheerganize/database/databaseObjects/Routine.dart';
import 'package:cheerganize/screens/NewRoutine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountsPlan extends StatefulWidget {
  CountsPlan({this.routine});

  final Routine routine;

  @override
  _CountsPlan createState() => _CountsPlan();
}

class _CountsPlan extends State<CountsPlan> {
  @override
  Widget build(BuildContext context) {
    List<String> skills;
    int bpm;
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
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
              BlackPawsCircleAvatar(radius: 80.0),
              SizedBox(height: 20.0),
              Table(
                border: TableBorder.all(color: BasicBlackColor, width: 2.0),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(0, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(1, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(2, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(3, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(4, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(5, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(6, value);
                          },
                        ),
                      ),
                      TableCell(
                        child: TableCellTextField(
                          onSubmitted: (String value) {
                            skills.insert(7, value);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CountSheet buildCountSheetObject(List<String> skills, int bpm) {
    return new CountSheet(skills, bpm);
  }
}
