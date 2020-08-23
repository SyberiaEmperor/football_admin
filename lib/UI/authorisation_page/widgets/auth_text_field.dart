import 'package:flutter/material.dart';
import 'package:football_app_admin/helpers/helpers.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController loginController;
  final TextEditingController pswdController;
  AuthTextField(this.loginController, this.pswdController);
  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  FocusNode _focusLogin = FocusNode();
  FocusNode _focusPassword = FocusNode();

  @override
  void dispose() {
    _focusLogin.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: Helpers.responsiveHeight(30, context),
            right: Helpers.responsiveWidth(20, context),
            left: Helpers.responsiveWidth(20, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          width: Helpers.responsiveWidth(320, context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: Helpers.responsiveWidth(56, context),
                height: Helpers.responsiveHeight(40, context),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.person,
                  size: Helpers.responsiveHeight(26, context),
                ),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(14, context),
              ),
              Container(
                width: Helpers.responsiveWidth(230, context),
                child: Form(
                  child: TextFormField(
                    controller: widget.loginController,
                    focusNode: _focusLogin,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(17, context),
                    ),
                    cursorColor: Theme.of(context).textTheme.bodyText1.color,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: "Логин",
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2.fontFamily,
                        fontSize: Helpers.responsiveHeight(17, context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: Helpers.responsiveWidth(20, context),
            left: Helpers.responsiveWidth(20, context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          width: Helpers.responsiveWidth(320, context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: Helpers.responsiveWidth(56, context),
                height: Helpers.responsiveHeight(40, context),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Icon(
                  Icons.vpn_key,
                  size: Helpers.responsiveHeight(26, context),
                ),
              ),
              SizedBox(
                width: Helpers.responsiveWidth(14, context),
              ),
              Container(
                width: Helpers.responsiveWidth(230, context),
                child: Form(
                  child: TextFormField(
                    controller: widget.pswdController,
                    focusNode: _focusPassword,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(17, context),
                    ),
                    cursorColor: Theme.of(context).textTheme.bodyText1.color,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: "Пароль",
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2.fontFamily,
                        fontSize: Helpers.responsiveHeight(17, context),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
