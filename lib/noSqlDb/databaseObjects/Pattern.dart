import 'dart:convert';

class Pattern {
  int _patternid;
  String _url;

  Pattern(String url) {
    this._patternid = _patternid;
    this._url = url;
  }

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

  int get patternid => _patternid;

  String get url => _url;
}
