import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Athletes implements BuildDbObjectsInterface {
  @override
  Athletes buildDbObjectModel(String str) =>
      Athletes.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Athletes({
    this.athletesid,
    this.xcoordinate,
    this.ycoordinate,
    this.name,
    this.color,
  });

  int athletesid;
  double xcoordinate;
  double ycoordinate;
  String name;
  String color;

  @override
  factory Athletes.fromJson(Map<String, dynamic> json) => Athletes(
        athletesid: json["athletesid"],
        xcoordinate: json["xcoordinate"],
        ycoordinate: json["ycoordinate"],
        name: json["name"],
        color: json["color"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "athletesid": athletesid,
        "xcoordinate": xcoordinate,
        "ycoordinate": ycoordinate,
        "name": name,
        "color": color,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["xcoordinate"] = xcoordinate;
    map["ycoordinate"] = ycoordinate;
    map["name"] = name;
    map["color"] = color;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["athletesid"] = athletesid;
    map["xcoordinate"] = xcoordinate;
    map["ycoordinate"] = ycoordinate;
    map["name"] = name;
    map["color"] = color;
    return map;
  }

//to be used when converting the row into object
  factory Athletes.fromMap(Map<String, dynamic> data) => new Athletes(
      athletesid: data['athletesid'],
      xcoordinate: data['xcoordinate'],
      ycoordinate: data['ycoordinate'],
      name: data['name'],
      color: data['color']);
}
