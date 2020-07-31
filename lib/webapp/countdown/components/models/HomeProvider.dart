import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    init();
  }

  init() async {
    var pref = await SharedPreferences.getInstance();

    int s = pref.get("start");
    int d = pref.get("duration");
    if (s != null) {
      _start = DateTime.fromMillisecondsSinceEpoch(s);
    }
    if (d != null) {
      _duration = Duration(milliseconds: d);
    }
    notifyListeners();
  }

  DateTime _start = DateTime.now();

  Duration _duration = Duration(days: 0);

  set start(DateTime dateTime) {
    _start = dateTime;
    SharedPreferences.getInstance().then((value) {
      value.setInt("start", dateTime.millisecondsSinceEpoch);
    });
    notifyListeners();
  }

  set duration(Duration duration) {
    _duration = duration;
    SharedPreferences.getInstance().then((value) {
      value.setInt("duration", duration.inMilliseconds);
    });
    notifyListeners();
  }

  DateTime get start => _start;

  Duration get duration => _duration;
}
