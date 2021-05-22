import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Mat implements BuildDbObjectsInterface {

  int _matid;
  int _patternid;
  double _xcoordinate;
  double _ycoordinate;

  Mat(int patternid, double xcoordinate, double ycoordinate)
      {
    this._matid = _matid;
    this._patternid = patternid;
    this._xcoordinate = xcoordinate;
    this._ycoordinate = ycoordinate;
  }


  @override
  Map<String, dynamic> toJson() => {
        'matid': matid,
        'patternid': patternid,
        'xcoordinate': xcoordinate,
        'ycoordinate': ycoordinate,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['patternid'] = patternid;
    map['xcoordinate'] = xcoordinate;
    map['ycoordinate'] = ycoordinate;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['matid'] = matid;
    map['patternid'] = patternid;
    map['xcoordinate'] = xcoordinate;
    map['ycoordinate'] = ycoordinate;

    return map;
  }


  int get matid => _matid;

  double get ycoordinate => _ycoordinate;

  double get xcoordinate => _xcoordinate;

  int get patternid => _patternid;
}
