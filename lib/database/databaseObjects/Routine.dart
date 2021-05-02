import 'dart:convert';
import '../BuildDbObjectsInterface.dart';

class Routine implements BuildDbObjectsInterface {
  @override
  Routine buildDbObjectModel(String str) =>
      Routine.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Routine({
    this.routineid,
    this.musicid,
    this.athletesid,
    this.formationid,
    this.countsheetid,
  });

  int routineid;
  int musicid;
  int athletesid;
  int formationid;
  int countsheetid;

  @override
  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        routineid: json["routineid"],
        musicid: json["musicid"],
        athletesid: json["athletesid"],
        formationid: json["formationid"],
        countsheetid: json["countsheetid"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "routineid": routineid,
        "musicid": musicid,
        "athletesid": athletesid,
        "formationid": formationid,
        "countsheetid": countsheetid,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["musicid"] = musicid;
    map["athletesid"] = athletesid;
    map["formationid"] = formationid;
    map["countsheetid"] = countsheetid;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["routineid"] = routineid;
    map["musicid"] = musicid;
    map["athletesid"] = athletesid;
    map["formationid"] = formationid;
    map["countsheetid"] = countsheetid;

    return map;
  }

//to be used when converting the row into object
  factory Routine.fromMap(Map<String, dynamic> data) => new Routine(
      routineid: data['routineid'],
      musicid: data['musicid'],
      athletesid: data['athletesid'],
      formationid: data['formationid'],
      countsheetid: data['countsheetid']);
}
