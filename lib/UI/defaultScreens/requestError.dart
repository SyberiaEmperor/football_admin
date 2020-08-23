import 'package:flutter/material.dart';

/// Стандартный экрнан ошибки
Widget requestErrorScreen({
  @required String caption,
  Function onPressed,
}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(caption),
          FlatButton(
            child: Text("Обновить"),
            onPressed: onPressed,
          )
        ],
      ),
    ),
  );
}
