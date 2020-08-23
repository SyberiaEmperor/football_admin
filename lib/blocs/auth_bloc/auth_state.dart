part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  final bool error;
  final bool entered;
  final String errorText;

  AuthInitial({this.error = false, this.entered = false, this.errorText = ""});

  @override
  List<Object> get props => [error, entered, errorText];
}

class AuthLoading extends AuthState {
  final String caption;

  AuthLoading(this.caption);
  @override
  List<Object> get props => [caption];
}
