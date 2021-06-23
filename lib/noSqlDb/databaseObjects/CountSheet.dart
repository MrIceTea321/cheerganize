import 'package:flutter/material.dart';

class CountSheet {
  int id;
  Map<int, List<String>> skills;
  String name;
  int bpm;
  double duration;

  CountSheet(
      {@required this.skills,
      @required this.name,
      @required this.bpm,
      @required this.duration});

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'skills': skills,
        'name': name,
        'bpm': bpm,
        'duration': duration,
      };

  //to be used when inserting a row in the table
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['skills'] = skills;
    map['name'] = name;
    map['bpm'] = bpm;
    map['duration'] = duration;
    return map;
  }

  //to be used when updating a row in the table
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['id'] = id;
    map['skills'] = skills;
    map['name'] = name;
    map['bpm'] = bpm;
    map['duration'] = duration;

    return map;
  }

  static CountSheet buildFromDb(Map<String, dynamic> map) {
    return CountSheet(
        bpm: map['bpm'],
        duration: map['duration'],
        skills: map['skills'],
        name: map['name']);
  }
}
