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



  int get musicid => _musicid;

  String get title => _title;

  double get duration => _duration;
}
