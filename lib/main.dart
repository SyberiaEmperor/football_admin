import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app_admin/UI/authorisation_page/authorisation_page.dart';
import 'package:football_app_admin/UI/on_stadium_page/on_stadium_page.dart';
import 'package:football_app_admin/UI/splash_screen.dart';
import 'package:football_app_admin/blocs/auth_bloc/auth_bloc.dart';
import 'package:football_app_admin/blocs/chants_bloc/chants_bloc.dart';

import 'UI/authorisation_page/authorisation_page.dart';
import 'UI/navigation_page/navigation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final authBloc = AuthBloc();
  static final chantsBloc = ChantsBloc();

  static int userOnline = 0;

  static final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final auth = BlocProvider<AuthBloc>(create: (_) => MyApp.authBloc);
    final chant = BlocProvider<ChantsBloc>(
      create: (_) => MyApp.chantsBloc,
    );

    return MultiBlocProvider(
      providers: [auth, chant],
      child: MaterialApp(
        title: 'Football-app',
        theme: ThemeData(
          // primaryColor:Colors.black,
          // accentColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );

    /*return BlocProvider(
      create: (context) => ChantsBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BlocProvider<auth.AuthBloc>(
            create: (context) => AuthBloc(),
            child: AuthorisationPage(),
          )),*/

    /*return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),*/
  }
}
