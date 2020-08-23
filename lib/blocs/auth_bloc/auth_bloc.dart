import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app_admin/blocs/chants_bloc/chants_bloc.dart';
import 'package:football_app_admin/helpers/requests.dart';
import 'package:football_app_admin/helpers/socket.dart';
import 'package:football_app_admin/helpers/socket.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading("Проверка данных")) {
    this.add(CheckPrefs());
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckPrefs) {
      var _prefs = await SharedPreferences.getInstance();
      String login = _prefs.get('login');
      String password = _prefs.get('password');
      if (login == null || password == null) {
        yield AuthInitial();
      } else {
        try {
          bool success = await Requests.logIn(login: login, password: password);
          SocketStream ss = SocketStream();
          yield AuthInitial(entered: success);
        } catch (eror) {
          yield AuthInitial();
        }
      }
    }
    if (event is LogIn) {
      bool result =
          await Requests.logIn(login: event.login, password: event.password);
      if (result) {
        var _prefs = await SharedPreferences.getInstance();
        _prefs.setString('login', event.login);
        _prefs.setString('password', event.password);
        SocketStream ss = SocketStream(); //TODO: Перенести на стадион
        yield AuthInitial(entered: true);
      } else {
        yield AuthInitial(
            error: true, errorText: 'Некорректное сочетание логина и пароля');
      }
    }
  }
}
