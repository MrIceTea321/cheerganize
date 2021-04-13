import 'package:cheerganize/consts/buttons/MenuButton.dart';
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

    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('images/logoRemovedBackground.png'),
          title: Text("Cheerganize"),
          actions: <Widget>[
            IconButton(
                iconSize: 40.0,
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, 'Settings');
                }),
          ],
        ),
        body: new ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext contex, index) {
              return MenuButton(
                text: 'Routine',
                onPress: () {
                  Navigator.pushNamed(context, 'Settings');
                  //TODO insert different Routines (maybe steal code from
                  // studycards project - but refactor first)
                },
              );
            }));
  }
}
