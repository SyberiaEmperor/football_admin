import 'package:flutter/material.dart';
import 'package:football_app_admin/helpers/MatchStream.dart';
import 'package:football_app_admin/main.dart';

/// Стандартный экрнан ошибки
Widget Human_Counter() {
  return StreamBuilder(
    stream: MatchStream.matchStream.stream.asBroadcastStream(),
    builder: (context, snapshot) {
      print(snapshot);
      return Text(MyApp.userOnline.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
    },
  );
}
