import 'dart:convert';

class BuildDbObjectsInterface {
  BuildDbObjectsInterface buildDbObjectModel(String str) =>
      BuildDbObjectsInterface.fromJson(json.decode(str));

  String buildDbObjectModelToJson(dynamic data) => json.encode(data.toJson());

  BuildDbObjectsInterface({exampleId});

  factory BuildDbObjectsInterface.fromJson(Map<String, dynamic> json) =>
      BuildDbObjectsInterface();

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

  factory BuildDbObjectsInterface.fromMap(Map<String, dynamic> data) =>
      //to be used when converting the row into object
  new BuildDbObjectsInterface();
}
