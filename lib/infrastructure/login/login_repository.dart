import 'package:fpdart/fpdart.dart';
import 'package:recipely/domain/auth/auth_failure.dart';
import 'package:recipely/domain/auth/i_auth_repository.dart';
import 'package:recipely/domain/login/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository({
    required this.iAuthRepository,
  });

  final IAuthRepository iAuthRepository;

  @override
  Future<Either<AuthFailure, Unit>> login(
      {required String email, required String password}) async {
    return await iAuthRepository.signInWithEmailAndPassword(
        emailAddress: email, password: password);
  }
}
