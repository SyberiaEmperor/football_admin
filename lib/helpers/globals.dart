import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// используется для онбординга и настроек уведомлений
SharedPreferences prefs;

class MyGlobals {
  GlobalKey _scaffoldAuthKey;
  GlobalKey _scaffoldProfileKey;
  bool auth = true;
  MyGlobals() {
    _scaffoldAuthKey = GlobalKey();
    _scaffoldProfileKey = GlobalKey();
  }
  GlobalKey get authKey => _scaffoldAuthKey;
  GlobalKey get profileKey => _scaffoldProfileKey;
  GlobalKey get globalKey => auth ? _scaffoldAuthKey : _scaffoldProfileKey;
}
