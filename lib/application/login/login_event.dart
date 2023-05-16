// ignore_for_file: always_specify_types

part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.password, required this.email});
  final String password;
  final String email;
}
