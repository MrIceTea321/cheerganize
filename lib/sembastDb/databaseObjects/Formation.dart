import 'dart:convert';

import 'package:Cheerganize/sembastDb//databaseObjects/Athlete.dart';

import 'Music.dart';

class Formation {
  int _id;
  String _nameTag;
  List<Athlete> _athletes;
  Music _musicObject;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get nameTag => _nameTag;

  set nameTag(String value) {
    _nameTag = value;
  }

  List<Athlete> get athletes => _athletes;

  set athletes(List<Athlete> value) {
    _athletes = value;
  }

  Music get musicObject => _musicObject;

  @override
  String toString() {
    return 'Formation{_id: $_id, _nameTag: $_nameTag, _athletes: $_athletes, _musicObject: $_musicObject}';
  }

  set musicObject(Music value) {
    _musicObject = value;
  }
}
