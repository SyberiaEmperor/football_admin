import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Platform.isAndroid ? Icon(
        Icons.arrow_back,
        color: Theme.of(context).accentColor,
        size: 28,
      )
      :
      Icon( 
        CupertinoIcons.left_chevron,
        color: Theme.of(context).accentColor,
        size: 28,
      )
    );
  }
}
