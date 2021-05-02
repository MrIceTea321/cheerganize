import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Mat implements BuildDbObjectsInterface {
  @override
  Mat buildDbObjectModel(String str) => Mat.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Mat({
    this.matid,
    this.patternid,
    this.xcoordinate,
    this.ycoordinate,
  });

  int matid;
  int patternid;
  double xcoordinate;
  double ycoordinate;

  @override
  factory Mat.fromJson(Map<String, dynamic> json) => Mat(
        matid: json['matid'],
        patternid: json['patternid'],
        xcoordinate: json['xcoordinate'],
        ycoordinate: json['ycoordinate'],
      );

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

//to be used when converting the row into object
  factory Mat.fromMap(Map<String, dynamic> data) => new Mat(
      matid: data['matid'],
      patternid: data['patternid'],
      xcoordinate: data['xcoordinate'],
      ycoordinate: data['ycoordinate']);
}
