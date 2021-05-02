import 'dart:convert';
import '../BuildDbObjectsInterface.dart';

class Sjr implements BuildDbObjectsInterface {
  @override
  Sjr buildDbObjectModel(String str) => Sjr.fromJson(json.decode(str));

  @override
  String buildDbObjectModelToJson(data) =>
      json.encode(data.toJson());

  Sjr({
    this.sjrId,
    this.city,
    this.name,
    this.adress,
    this.phoneNumber,
    this.eMail,
    this.url,
    this.description,
  });

  int sjrId;
  String city;
  String name;
  String adress;
  String phoneNumber;
  String eMail;
  String url;
  String description;

  @override
  factory Sjr.fromJson(Map<String, dynamic> json) => Sjr(
        sjrId: json["id"],
        city: json["city"],
        name: json["name"],
        adress: json["adress"],
        phoneNumber: json["phoneNumber"],
        eMail: json["eMail"],
        url: json["url"],
        description: json["description"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": sjrId,
        "city": city,
        "name": name,
        "adress": adress,
        "phoneNumber": phoneNumber,
        "eMail": eMail,
        "url": url,
        "description": description,
      };

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["city"] = city;
    map["name"] = name;
    map["adress"] = adress;
    map["phoneNumber"] = phoneNumber;
    map["eMail"] = eMail;
    map["url"] = url;
    map["description"] = description;
    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["id"] = sjrId;
    map["city"] = city;
    map["name"] = name;
    map["adress"] = adress;
    map["phoneNumber"] = phoneNumber;
    map["eMail"] = eMail;
    map["url"] = url;
    map["description"] = description;
    return map;
  }

//to be used when converting the row into object
  factory Sjr.fromMap(Map<String, dynamic> data) => new Sjr(
      sjrId: data['id'],
      city: data['city'],
      name: data['name'],
      adress: data['adress'],
      phoneNumber: data['phoneNumber'],
      eMail: data['eMail'],
      url: data['url'],
      description: data['description']);
}
