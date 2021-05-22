import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:cheerganize/database/DbInitiator.dart';

import '../BuildDbObjectsInterface.dart';

class Routine  {

  @override
  //Routine buildDbObjectModel(String str) => Routine.fromJson(json.decode
  // (str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  int _routineid;
  int _musicid;
  int _athletesid;
  int _formationid;
  int _countsheetid;
  String _name;
  String _typeofsport;

  Routine(String name, String typeofsport) {
    this._routineid = routineid;
    this._musicid = musicid;
    this._athletesid = athletesid;
    this._formationid = formationid;
    this._countsheetid = countsheetid;
    this._name = name;
    this._typeofsport = typeofsport;
  }


  int get routineid => _routineid;

  set routineid(int value) {
    _routineid = value;
  }

  //@override
  //factory Routine.fromJson(Map<String, dynamic> json) =>
      //Routine(
      //  routineid: json['_routineid'],
       // musicid: json['_musicid'],
       // athletesid: json['_athletesid'],
       // formationid: json['formationid'],
        //countsheetid: json['countsheetid'],
       // name: json['name'],
      //  typeofsport: json['typeofsport'],
     // );

  @override
  Map<String, dynamic> toJson() =>
      {
        'routineid': routineid,
        'musicid': musicid,
        'athletesid': athletesid,
        'formationid': formationid,
        'countsheetid': countsheetid,
        'name': name,
        'typeofsport': typeofsport
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['musicid'] = musicid;
    map['athletesid'] = athletesid;
    map['formationid'] = formationid;
    map['countsheetid'] = countsheetid;
    map['name'] = name;
    map['typeofsport'] = typeofsport;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['routineid'] = routineid;
    map['musicid'] = musicid;
    map['athletesid'] = athletesid;
    map['formationid'] = formationid;
    map['countsheetid'] = countsheetid;

    return map;
  }

//to be used when converting the row into object
  //factory Routine.fromMap(Map<String, dynamic> data) =>
     // new Routine(
        //  routineid: data['routineid'],
         // musicid: data['musicid'],
         // athletesid: data['athletesid'],
        //  formationid: data['formationid'],
        //  countsheetid: data['countsheetid'],
       //   name: data['name'],
       //   typeofsport: data['typeofsport']);

  int get musicid => _musicid;

  set musicid(int value) {
    _musicid = value;
  }

  int get athletesid => _athletesid;

  set athletesid(int value) {
    _athletesid = value;
  }

  int get formationid => _formationid;

  set formationid(int value) {
    _formationid = value;
  }

  int get countsheetid => _countsheetid;

  set countsheetid(int value) {
    _countsheetid = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get typeofsport => _typeofsport;

  set typeofsport(String value) {
    _typeofsport = value;
  }
}
