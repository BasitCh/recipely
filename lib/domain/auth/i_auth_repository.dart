// import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: depend_on_referenced_packages

import 'package:fpdart/fpdart.dart';
import 'package:recipely/domain/auth/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
}
