import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Formation implements BuildDbObjectsInterface {
  int _formationid;
  int _routineid;
  int _athletesid;
  int _matid;
  int _patternid;
  String _name;

  Formation(
      int routineid, int athletsid, int matid, int patternid, String name) {
    this._formationid = _formationid;
    this._routineid = routineid;
    this._athletesid = athletsid;
    this._matid = matid;
    this._patternid = patternid;
    this._name = name;
  }

  @override
  Map<String, dynamic> toJson() => {
        'formationid': formationid,
        'routineid': routineid,
        'athletesid': athletesid,
        'matid': matid,
        'patternid': patternid,
        'name': name
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['routineid'] = routineid;
    map['athletesid'] = athletesid;
    map['matid'] = matid;
    map['patternid'] = patternid;
    map['name'] = name;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['formationid'] = formationid;
    map['routineid'] = routineid;
    map['athletesid'] = athletesid;
    map['matid'] = matid;
    map['patternid'] = patternid;
    map['name'] = name;
    return map;
  }

  int get formationid => _formationid;

  int get routineid => _routineid;

  int get athletesid => _athletesid;

  int get matid => _matid;

  int get patternid => _patternid;

  String get name => _name;
}
