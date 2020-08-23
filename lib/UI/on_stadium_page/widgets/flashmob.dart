import 'package:flutter/material.dart';
import 'package:football_app_admin/helpers/helpers.dart';

class Flashmob extends StatelessWidget {
  final String asset;
  final Function onTap;
  final String text;
  const Flashmob({Key key, this.asset, this.onTap, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          width:MediaQuery.of(context).size.width,
          height: Helpers.responsiveHeight(212, context),
          child: Stack(
            children: [
              Image.asset(asset,fit: BoxFit.fill, width:MediaQuery.of(context).size.width),
              Center(
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(Radius.circular(
                              Helpers.responsiveWidth(8, context)))),
                      width: Helpers.responsiveWidth(220, context),
                      height: Helpers.responsiveHeight(54, context),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ))),
            ],
          )),
    );
  }
}
