// ignore_for_file: always_specify_types, unrelated_type_equality_checks

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/infrastructure/login/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<LoginSubmitted>((event, emit) async {
      await _onSubmitted(event, emit);
    });
  }

  FutureOr<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoggingIn());
    final response = await loginRepository.login(
        email: event.email, password: event.password);
    response.fold(
      (left) => emit(
        LoginError(
          message: left.when(
            cancelledByUser: () {
              return 'Cancelled by user';
            },
            serverError: () {
              return 'Server Error';
            },
            emailAlreadyInUse: () {
              return '';
            },
            invalidEmailAndPasswordCombination: () {
              return 'Invalid combination of email and password';
            },
          ),
        ),
      ),
      (response) => emit(
        const LoginSuccess(),
      ),
    );
  }

  String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password can not be empty';
    } else if (val.length < 6) {
      return 'Password must be 6 characters';
    } else {
      return null;
    }
  }
}
