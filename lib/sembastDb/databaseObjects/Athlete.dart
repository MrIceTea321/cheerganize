import 'dart:convert';

class Athlete {
  int _id;
  String _name;
  String _color;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  @override
  String toString() {
    return 'Athlete{_id: $_id, _name: $_name, _color: $_color}';
  }
}
