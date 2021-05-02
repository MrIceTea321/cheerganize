import 'dart:convert';

import '../BuildDbObjectsInterface.dart';

class Pattern implements BuildDbObjectsInterface {
  @override
  Pattern buildDbObjectModel(String str) => Pattern.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) => json.encode(data.toJson());

  Pattern({
    this.patternid,
    this.url,
  });
  
  int patternid;
  String url;

  @override
  factory Pattern.fromJson(Map<String, dynamic> json) => Pattern(
    patternid: json['patternid'],
    url: json['url'],
  );

  @override
  Map<String, dynamic> toJson() => {
    'patternid': patternid,
    'url': url,
  };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['patternid'] = patternid;
    map['url'] = url;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['patternid'] = patternid;
    map['url'] = url;

    return map;
  }

//to be used when converting the row into object
  factory Pattern.fromMap(Map<String, dynamic> data) => new Pattern(
      patternid: data['patternid'],
      url: data['url']);
}
