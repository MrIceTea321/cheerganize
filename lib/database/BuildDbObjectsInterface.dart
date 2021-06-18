import 'dart:convert';

class BuildDbObjectsInterface {

  BuildDbObjectsInterface({exampleId});


  Map<String, dynamic> toJson() => {};

  Map<String, dynamic> toMapWithoutId() {
    //to be used when inserting a row in the table

    final map = new Map<String, dynamic>();
    return map;
  }

  Map<String, dynamic> toMap() {
    //to be used when updating a row in the table

    final map = new Map<String, dynamic>();
    return map;
  }

}
