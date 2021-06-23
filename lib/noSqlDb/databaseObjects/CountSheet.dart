import 'package:flutter/material.dart';

import 'Skills.dart';

class CountSheet {
  int id;
  List<Skills> tableList;
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
          tableList.map((skills) => skills.toMap()).toList(growable: true),
      'name': name,
      'bpm': bpm,
      'duration': duration,
    };
  }

  static CountSheet fromMap(Map<String, dynamic> map) {
    return CountSheet(
        id: map['id'],
        tableList: map['tableList']
            .map((mapping) => Skills.fromMap(mapping))
            .toList()
            .cast<Skills>(),
        name: map['name'],
        bpm: map['bpm'],
        duration: map['duration']);
  }
}
