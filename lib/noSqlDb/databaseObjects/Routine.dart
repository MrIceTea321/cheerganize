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

  @override
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'typeofsport': typeofsport};

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['name'] = name;
    map['typeofsport'] = typeofsport;

    return map;
  }

  //to be used when updating a row in the table
  @override
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
