import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Formation implements BuildDbObjectsInterface {
  @override
  Formation buildDbObjectModel(String str) =>
      Formation.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Formation({
    this.formationid,
    this.routineid,
    this.athletesid,
    this.matid,
    this.patternid,
    this.name,
  });

  int formationid;
  int routineid;
  int athletesid;
  int matid;
  int patternid;
  String name;

  @override
  factory Formation.fromJson(Map<String, dynamic> json) => Formation(
        formationid: json["formationid"],
        routineid: json["routineid"],
        athletesid: json["athletesid"],
        matid: json["matid"],
        patternid: json["patternid"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "formationid": formationid,
        "routineid": routineid,
        "athletesid": athletesid,
        "matid": matid,
        "patternid": patternid,
        "name": name
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["routineid"] = routineid;
    map["athletesid"] = athletesid;
    map["matid"] = matid;
    map["patternid"] = patternid;
    map["name"] = name;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["formationid"] = formationid;
    map["routineid"] = routineid;
    map["athletesid"] = athletesid;
    map["matid"] = matid;
    map["patternid"] = patternid;
    map["name"] = name;
    return map;
  }

//to be used when converting the row into object
  factory Formation.fromMap(Map<String, dynamic> data) => new Formation(
      formationid: data['formationid'],
      routineid: data['routineid'],
      athletesid: data['athletesid'],
      matid: data['matid'],
      patternid: data['patternid'],
      name: data['name']);
}
