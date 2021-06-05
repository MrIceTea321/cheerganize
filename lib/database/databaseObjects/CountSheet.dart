import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class CountSheet implements BuildDbObjectsInterface {
  int _countsheetid;
  int _musicid;
  Map<int, List<String>> _skills;
  int _bpm;
  double _duration;

  CountSheet(int bpm, double duration){
    this._countsheetid = _countsheetid;
    this._musicid = _musicid;
    this._skills = _skills;
    this._bpm = bpm;
    this._duration = duration;
  }

  @override
  Map<String, dynamic> toJson() => {
        'countsheetid': countsheetid,
        'musicid': musicid,
        'skills': skills,
        'bpm': bpm,
        'duration': duration,

  };

   //to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['musicid'] = musicid;
    map['skills'] = skills;
    map['bpm'] = bpm;
    map['duration'] = duration;

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
    map['duration'] = duration;

    return map;
  }

  int get countsheetid => _countsheetid;

  int get musicid => _musicid;


  Map<int, List<String>> get skills => _skills;

  set skills(Map<int, List<String>> value) {
    _skills = value;
  }

  int get bpm => _bpm;

  double get duration => _duration;

  set duration(double value) {
    _duration = value;
  }
}
