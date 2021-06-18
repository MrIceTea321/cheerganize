import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../BuildDbObjectsInterface.dart';

class CountSheet implements BuildDbObjectsInterface {
  int _countsheetid;
  int _musicid;
  String _skills;
  String _label;
  int _bpm;
  double _duration;

  CountSheet(int bpm, double duration, String skills, String
  label){
    this._countsheetid = _countsheetid;
    this._musicid = _musicid;
    this._skills = skills;
    this._label = label;
    this._bpm = bpm;
    this._duration = duration;
  }


  @override
  String toString() {
    return 'CountSheet{_countsheetid: $_countsheetid, _musicid: $_musicid, _skills: $_skills, _bpm: $_bpm, _duration: $_duration}';
  }

  CountSheet.build(int countsheetid, int bpm, double duration, String skills,
      String label){
    this._countsheetid = countsheetid;
    this._musicid = _musicid;
    this._skills = skills;
    this._label = label;
    this._bpm = bpm;
    this._duration = duration;
  }

  @override
  Map<String, dynamic> toJson() => {
        'countsheetid': countsheetid,
        'musicid': musicid,
        'skills': skills,
        'label': label,
        'bpm': bpm,
        'duration': duration,

  };

  set countsheetid(int value) {
    _countsheetid = value;
  } //to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['musicid'] = musicid;
    map['label'] = label;
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
    map['label'] = label;
    map['bpm'] = bpm;
    map['duration'] = duration;

    return map;
  }

  int get countsheetid => _countsheetid;

  int get musicid => _musicid;

  String get skills => _skills;

  set skills(String value) {
    _skills = value;
  }


  String get label => _label;

  set label(String value) {
    _label = value;
  }

  int get bpm => _bpm;

  double get duration => _duration;

  set duration(double value) {
    _duration = value;
  }

  set bpm(int value) {
    _bpm = value;
  }
}
