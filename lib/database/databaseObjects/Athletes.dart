import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Athletes implements BuildDbObjectsInterface {

  int _athletesid;
  double _xcoordinate;
  double _ycoordinate;
  String _name;
  String _color;

  Athletes(double xcoordinate, double ycoordinate, String name, String color){
    this._athletesid = _athletesid;
    this._xcoordinate = xcoordinate;
    this._ycoordinate = ycoordinate;
    this._name = name;
    this._color = color;
  }

  @override
  Map<String, dynamic> toJson() => {
        'athletesid': athletesid,
        'xcoordinate': xcoordinate,
        'ycoordinate': ycoordinate,
        'name': name,
        'color': color,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['xcoordinate'] = xcoordinate;
    map['ycoordinate'] = ycoordinate;
    map['name'] = name;
    map['color'] = color;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['athletesid'] = athletesid;
    map['xcoordinate'] = xcoordinate;
    map['ycoordinate'] = ycoordinate;
    map['name'] = name;
    map['color'] = color;
    return map;
  }

  int get athletesid => _athletesid;

  double get xcoordinate => _xcoordinate;


  double get ycoordinate => _ycoordinate;


  String get name => _name;


  String get color => _color;

}
