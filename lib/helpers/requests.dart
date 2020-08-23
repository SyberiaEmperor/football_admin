import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_app_admin/models/chants.dart';
import 'package:http/http.dart' as http;

import 'helpers.dart';

class Requests {
  // ignore: non_constant_identifier_names
  static String URL = 'http://$IP';
  static String IP = "178.154.255.209:3002";
  // ignore: non_constant_identifier_names
  static String Gtoken;

  ///Войти в систему
  static Future<bool> logIn(
      {@required String login, @required String password}) async {
    String body = jsonEncode(<String, dynamic>{
      "auth": {"login": login, "password": password}
    });
    var response = await http
        .post(URL + '/superuser_token',
            body: body,
            headers: <String, String>{'Content-Type': 'application/json'})
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    if (response.statusCode == 201) {
      Gtoken = jsonDecode(response.body)['jwt'];
      return true;
    }

    return false;
  }

  ///Получить список всех кричалок
  static Future<List<Chants>> getChants() async {
    List<Chants> result = new List<Chants>();
    var response = await http
        .get(URL + '/chants')
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
      handleLostConnection();
    });
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      body.forEach((value) {
        result.add(Chants.fromData(value));
      });
    }
    return result;
  }

  ///Запустить ивент "кричалка". Параметр flashlight равен 0 или 1
  static Future<bool> startChant(int id, int flashlight) async {
    var response = await http
        .post(
          URL + '/superuser/start_chant',
          body: jsonEncode(
            {
              'id': id,
              'flash_light': flashlight,
            },
          ),
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader: Gtoken
          },
        )
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    return response.statusCode == 200;
  }

  ///Запустить ивент светошоу
  static Future<bool> startLightshow(int lighsnowMode) async {
    var response = await http
        .post(
          URL + '/superuser/start_lightshow',
          body: jsonEncode(
            {
              'mode': lighsnowMode,
            },
          ),
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader: Gtoken
          },
        )
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    return response.statusCode == 200;
  }

  ///Отправить сообщение всем болельщикам
  static Future<bool> sendMessage(String text) async {
    var response = await http
        .post(
          URL + '/superuser/push_message_to_all',
          body: jsonEncode({'content': text}),
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader: Gtoken
          },
        )
        .timeout(Duration(seconds: 10))
        .catchError((_) => handleTimeOutException(),
            test: (e) => e is TimeoutException)
        .catchError((_) {
          handleLostConnection();
        });
    return response.statusCode == 200;
  } //TODO: Complete this.

  static void handleTimeOutException() {
    Helpers.showWarningDialog('Ошибка получения данных',
        'Время на загрузку истекло. Повторите попытку.');
  }

  static void handleLostConnection() {
    Helpers.showWarningDialog(
      'Ошибка получения данных',
      'Соединение с сервером потеряно. Проверьте Интернет-соединение и обновите данные.',
    );
  }
}
