import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class CountSheet implements BuildDbObjectsInterface {
  @override
  CountSheet buildDbObjectModel(String str) =>
      CountSheet.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  CountSheet({
    this.countsheetid,
    this.musicid,
    this.skills,
    this.bpm,
  });

  int countsheetid;
  int musicid;
  String skills;
  int bpm;

  @override
  factory CountSheet.fromJson(Map<String, dynamic> json) => CountSheet(
        countsheetid: json["countsheetid"],
        musicid: json["musicid"],
        skills: json["skills"],
        bpm: json["bpm"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "countsheetid": countsheetid,
        "musicid": musicid,
        "skills": skills,
        "bpm": bpm,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["countsheetid"] = countsheetid;
    map["musicid"] = musicid;
    map["skills"] = skills;
    map["bpm"] = bpm;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["countsheetid"] = countsheetid;
    map["musicid"] = musicid;
    map["skills"] = skills;
    map["bpm"] = bpm;

    return map;
  }

//to be used when converting the row into object
  factory CountSheet.fromMap(Map<String, dynamic> data) => new CountSheet(
      countsheetid: data['countsheetid'],
      musicid: data['musicid'],
      skills: data['skills'],
      bpm: data['bpm']);
}
