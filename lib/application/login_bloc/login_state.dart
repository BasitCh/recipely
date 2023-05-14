part of 'login_bloc.dart';

class LoginState {
  const LoginState();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginError extends LoginState {
  final String? message;

  const LoginError({
    this.message,
  });
}

class LoggingIn extends LoginState {}
