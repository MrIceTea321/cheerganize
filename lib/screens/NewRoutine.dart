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
          leading: IconButton(
            icon: Icon(Icons.home),
            iconSize: 40.0,
            onPressed: () {
              Navigator.pushNamed(context, 'HomeScreen');
            },
          ),
        )
    );
  }
}
