import 'package:Cheerganize/consts/CheerganizeCircleAvatar.dart';
import 'package:Cheerganize/consts/textFields/ConstTextField.dart';
import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/buttons/BigFunctionButton.dart';
import 'package:Cheerganize/sembastDb/dataAccessObjects/CountSheetDao.dart';
import 'package:Cheerganize/sembastDb/dataAccessObjects/RoutineDao.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/CountSheet.dart';
import 'package:Cheerganize/sembastDb/databaseObjects/Routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverhaulRoutine extends StatefulWidget {
  final Routine routine;

  int idHelper = 0;

  OverhaulRoutine({Key key, this.routine}) : super(key: key);

  @override
  _OverhaulRoutine createState() => _OverhaulRoutine();
}

class _OverhaulRoutine extends State<OverhaulRoutine> {
  @override
  void initState() {
    widget.idHelper = widget.routine.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
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
          style: CheerganizeAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 40.0),
            CheerganizeCircleAvatar(radius: 125.0),
            SizedBox(height: 50.0),
            ConstTextField(
              hintText: 'Neuer Name',
              onChanged: (String value) {
                widget.routine.name = value;
              },
            ),
            ConstTextField(
              hintText: 'Neue Kategorie',
              onChanged: (String value) {
                widget.routine.typeofsport = value;
              },
            ),
            SizedBox(height: 40.0),
            BigFunctionButton(
              text: 'Routine bearbeitet',
              onPress: () async {
                CountSheet sheet =
                    await CountSheetDao().getCountSheetById(widget.idHelper);
                sheet.name = widget.routine.name;
                RoutineDao().update(widget.routine);
                Navigator.pushNamed(context, 'HomeScreen');
              },
              marginLTRB: [10.0, 10.0, 10.0, 10.0],
            ),
          ],
        ),
      ),
    );
  }
}
