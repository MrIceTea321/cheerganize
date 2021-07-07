import 'package:Cheerganize/consts/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: IconColorWhite,
              iconSize: 40.0,
              onPressed: () {
                Navigator.pushNamed(context, 'HomeScreen');
              },
            ),
          ],
          title: Text(
            'Einstellungen',
            style: CheerganizeAppBarTextStyle,
          )),
    );
  }
}
