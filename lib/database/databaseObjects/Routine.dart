import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'package:cheerganize/database/DbInitiator.dart';

import '../BuildDbObjectsInterface.dart';

class Routine {

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

  Routine.buildFromMap(Map<String, dynamic> routines) {
    this._routineid = routines.values.elementAt(0);
    this._musicid = routines.values.elementAt(1);
    this._athletesid = routines.values.elementAt(2);
    this._formationid = routines.values.elementAt(3);
    this._countsheetid = routines.values.elementAt(4);
    this._name = routines.values.elementAt(5);
    this._typeofsport = routines.values.elementAt(6);
  }

  Routine.buildFromDb(int routineid, int musicid, int athletesid,
      int formationid, int countsheetid, String name, String typeofsport) {
    this._routineid = routineid;
    this._musicid = musicid;
    this._athletesid = athletesid;
    this._formationid = formationid;
    this._countsheetid = countsheetid;
    this._name = name;
    this._typeofsport = typeofsport;
  }

  @override
  Map<String, dynamic> toJson() => {
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
    map['routineid'] = _routineid;
    map['musicid'] = _musicid;
    map['athletesid'] = _athletesid;
    map['formationid'] = _formationid;
    map['countsheetid'] = _countsheetid;
    map['name'] = _name;
    map['typeofsport'] = _typeofsport;
    return map;
  }

  int get routineid => _routineid;

  set routineid(int value) {
    _routineid = value;
  }

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

  @override
  String toString() {
    return 'Routine{_routineid: $_routineid, _musicid: $_musicid, _athletesid: $_athletesid, _formationid: $_formationid, _countsheetid: $_countsheetid, _name: $_name, _typeofsport: $_typeofsport}';
  }
}
