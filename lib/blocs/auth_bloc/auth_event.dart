part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckPrefs extends AuthEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LogIn extends AuthEvent {
  final String login;
  final String password;

  LogIn(this.login, this.password);
  @override
  List<Object> get props => [login, password];
}
