import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Music implements BuildDbObjectsInterface {
  @override
  Music buildDbObjectModel(String str) => Music.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Music({
    this.musicid,
    this.title,
    this.duration,
  });

  int musicid;
  String title;
  double duration;

  @override
  factory Music.fromJson(Map<String, dynamic> json) => Music(
      musicid: json["musicid"],
      title: json["title"],
      duration: json["duration"]);

  @override
  Map<String, dynamic> toJson() =>
      {"musicid": musicid, "title": title, "duration": duration};

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["musicid"] = musicid;
    map["skills"] = title;
    map["bpm"] = duration;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["musicid"] = musicid;
    map["title"] = title;
    map["duration"] = duration;

    return map;
  }

//to be used when converting the row into object
  factory Music.fromMap(Map<String, dynamic> data) => new Music(
      musicid: data['musicid'],
      title: data['title'],
      duration: data['duration']);
}
