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
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          actions: <Widget>[
            SafeArea(
              child: Image.asset('images/logoRemovedBackground.png'),
            ),
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
                  //TODO insert different Routines
                },
              );
            }));
  }
}
