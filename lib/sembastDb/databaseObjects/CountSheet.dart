import 'package:flutter/material.dart';

import 'Skill.dart';

class CountSheet {
  int id;
  List<Skill> tableList;
  String name;
  int bpm;
  double duration;

  CountSheet(
      {this.id,
      @required this.tableList,
      @required this.name,
      @required this.bpm,
      @required this.duration});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tableList':
          tableList.map((skills) => skills.toMap()).toList(growable: false),
      'name': name,
      'bpm': bpm,
      'duration': duration,
    };
  }

  static CountSheet fromMap(Map<String, dynamic> map) {
    return CountSheet(
        id: map['id'],
        tableList: map['tableList']
            .map((mapping) => Skill.fromMap(mapping))
            .toList()
            .cast<Skill>(),
        name: map['name'],
        bpm: map['bpm'],
        duration: map['duration']);
  }

  @override
  String toString() {
    return 'CountSheet{id: $id, tableList: $tableList, name: $name, bpm: $bpm, duration: $duration}';
  }
}
