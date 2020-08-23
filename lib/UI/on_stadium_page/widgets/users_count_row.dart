import 'package:flutter/material.dart';
import 'package:football_app_admin/UI/defaultScreens/human_counter.dart';
import 'package:football_app_admin/helpers/MatchStream.dart';
import 'package:football_app_admin/helpers/helpers.dart';

class UsersCountRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(56, context),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F4),
        borderRadius: BorderRadius.all(
            Radius.circular(Helpers.responsiveHeight(8, context))),
      ),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: Helpers.responsiveWidth(20, context),
                  right: Helpers.responsiveWidth(93, context)),
              child: Text('Онлайн сейчас',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 18))),
          SizedBox(
            width: Helpers.responsiveWidth(33, context),
          ),
          Human_Counter(),
        ],
      ),
    );
  }
}
