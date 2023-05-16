part of 'login_bloc.dart';

class LoginState {
  const LoginState();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginError extends LoginState {

  const LoginError({
    this.message,
  });
  final String? message;
}

class LoggingIn extends LoginState {}
