import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import '../main.dart';

class Helpers {
  static String getOnlyNumber(String number) {
    var a = number.split(new RegExp('[ --+()]'));
    String result = '';
    for (var c in a) result += c;
    return result;
  }

  /*static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (DataConnectionChecker().hasConnection);
    return connectivityResult;
  }*/

  static void showWarningDialog(String title, String body) {
    showDialog<void>(
      context: MyApp.globalKey.currentContext,
      builder: (BuildContext context) {
        return Platform.isAndroid
            ? AlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Text(title),
                content: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Ок',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body2.fontFamily,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
      },
    );
  }

  static double responsiveHeight(double size, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * (size / 740);
  }

  static double responsiveWidth(double size, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * (size / 360);
  }
}
