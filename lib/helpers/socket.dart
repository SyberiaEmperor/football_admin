import 'dart:convert';

import 'package:action_cable/action_cable.dart';
import 'package:football_app_admin/helpers/MatchStream.dart';
import 'package:football_app_admin/helpers/requests.dart';
import 'package:football_app_admin/main.dart';

class SocketStream {
  static String WS = 'ws://${Requests.IP}/cable';

  ActionCable cable;

  void connect() {
    cable = ActionCable.Connect("$WS?token=${Requests.Gtoken}&role=superuser",
        onConnected: () {
      print("Connected");
    }, onCannotConnect: () {
      print("Cannot connect");
    }, onConnectionLost: () {
      print("ConnectionLost");
    });

    cable.subscribe("CommandChannel", onSubscribed: () {},
        onMessage: (message) {
      print(message);

      if (message["sender_type"] == "System")
        MyApp.userOnline = message["count_online"] ?? 0;
      MatchStream.matchStream.add(message["count_online"]);
    });
  }

  SocketStream() {
    connect();
  }
//TODO: Перенести в клиента
  sendData(String data) {
    cable.performAction("CommandChannel",
        action: 'send', actionParams: {'check_in': 'ok'});
  }
}
