// ignore_for_file: one_member_abstracts

import 'package:fpdart/fpdart.dart';
import 'package:recipely/domain/auth/auth_failure.dart';

abstract class ILoginRepository {
  Future<Either<AuthFailure, Unit>> login({
    required String email,
    required String password,
  });
}
