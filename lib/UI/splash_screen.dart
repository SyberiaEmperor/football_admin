import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:football_app_admin/UI/on_stadium_page/on_stadium_page.dart';
import 'package:football_app_admin/blocs/chants_bloc/chants_bloc.dart';
import 'package:football_app_admin/helpers/helpers.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../main.dart';
import 'authorisation_page/authorisation_page.dart';
import 'navigation_page/navigation_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  GifController _controller;

  @override
  void dispose() {
    subscription1.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = GifController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    splashLogic();
    super.initState();
  }

  StreamSubscription subscription1;

  Future<void> splashLogic() async {
    const int DURATION = 2000;

    var aBloc = MyApp.authBloc;

    subscription1 = aBloc.listen((state) {});
    subscription1.onData((state) async {
      if (state is AuthInitial) {
        if (state.entered) {
          await Future.delayed(
            Duration(milliseconds: (DURATION * 0.83).round()),
          );
          MyApp.chantsBloc.add(LoadChants());
          _controller.reverse();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavPage(), //TODO: Return back
              ));
        } else {
          await Future.delayed(
            Duration(milliseconds: (DURATION * 0.83).round()),
          );
          _controller.reverse();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AuthorisationPage(),
              ));
        }
      }
    });
    aBloc.add(CheckPrefs());

    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GifImage(
          width: Helpers.responsiveHeight(100, context),
          height: Helpers.responsiveHeight(100, context),
          image: AssetImage('assets/ball.gif'),
          controller: _controller
            ..repeat(
              min: 0,
              max: 28,
              period: Duration(milliseconds: 1300),
            ),
        ),
      ),
    );
  }
}
