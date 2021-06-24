import 'dart:convert';

class Music {
  int _musicid;
  String _title;
  double _duration;

  Music(String title, double duration) {
    this._musicid = _musicid;
    this._title = title;
    this._duration = duration;
  }

  @override
  Map<String, dynamic> toJson() =>
      {'musicid': musicid, 'title': title, 'duration': duration};

//to be used when inserting a row in the table
  @override
  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map['skills'] = title;
    map['bpm'] = duration;

    return map;
  }

  //to be used when updating a row in the table
  @override
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['musicid'] = musicid;
    map['title'] = title;
    map['duration'] = duration;

    return map;
  }

  int get musicid => _musicid;

  String get title => _title;

  double get duration => _duration;
}
