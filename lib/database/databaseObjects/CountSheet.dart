import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class CountSheet implements BuildDbObjectsInterface {
  int _countsheetid;
  int _musicid;
  List<String> _skills;
  int _bpm;

  CountSheet(List<String> skills, int bpm){
    this._countsheetid = _countsheetid;
    this._musicid = musicid;
    this._skills = skills;
    this._bpm = bpm;
  }

  @override
  Map<String, dynamic> toJson() => {
        'countsheetid': countsheetid,
        'musicid': musicid,
        'skills': skills,
        'bpm': bpm,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['musicid'] = musicid;
    map['skills'] = skills;
    map['bpm'] = bpm;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['countsheetid'] = countsheetid;
    map['musicid'] = musicid;
    map['skills'] = skills;
    map['bpm'] = bpm;

    return map;
  }

  int get countsheetid => _countsheetid;

  int get musicid => _musicid;


  List<String> get skills => _skills;


  int get bpm => _bpm;


}
