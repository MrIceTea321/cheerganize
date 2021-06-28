import 'dart:core';

import 'package:flutter/material.dart';

class Routine {
  int id;
  String name;
  String typeofsport;

  Routine({int id, @required String name, @required String typeofsport}) {
    this.id = id;
    this.name = name;
    this.typeofsport = typeofsport;
  }

  static Routine buildFromMap(Map<String, dynamic> map) {
    return Routine(name: map['name'], typeofsport: map['typeofsport']);
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['name'] = name;
    map['typeofsport'] = typeofsport;
    return map;
  }

  @override
  String toString() {
    return 'Routine{id: $id, name: $name, typeOfSport: $typeofsport}';
  }
}
