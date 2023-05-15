// ignore_for_file: always_specify_types

part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginSubmitted extends LoginEvent {
  final String password;
  final String email;
  const LoginSubmitted({required this.password, required this.email});
}
