import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:recipely/domain/auth/i_auth_repository.dart';
import 'package:recipely/infrastructure/auth/firebase_auth_repository.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';

final GetIt getIt = GetIt.instance;
final firebaseAuth = FirebaseAuth.instance;

void registerServices() {
  getIt.registerSingleton<NavigationService>(GoRouterNavigationService());
  getIt.registerSingleton<IAuthRepository>(
    FirebaseAuthRepository(
      firebaseAuth,
    ),
  );
}
