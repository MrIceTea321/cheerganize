import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{

  @override
  _Settings createState()=> _Settings();

}

class _Settings extends State<Settings>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Settings'),
     ),
   );
  }

}