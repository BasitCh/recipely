
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Create a mock class for FirebaseAuth
class MockFirebaseAuth extends Mock {
  Future<bool> signInWithEmIailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    if (emailAddress == 'test@bobtail.com' && password == 'password') {
      return true;
    } else {
      return false;
    }
  }
}

void main() async {
  group('FirebaseAuthService', () {
    final mockFirebaseAuth = MockFirebaseAuth();
    // final authService = FirebaseAuthRepository(FirebaseAuth.instance);

    group('signInWithEmailAndPassword', () {
      test('returns true if sign-in is successful', () async {
        final signedIn = await mockFirebaseAuth.signInWithEmIailAndPassword(
          emailAddress: 'test@bobtail.com',
          password: 'password',
        );

        expect(signedIn, true);
      });

      test('throws false if sign-in fails', () async {
        // Mock the failed sign-in response
        final signedIn = await mockFirebaseAuth.signInWithEmIailAndPassword(
          emailAddress: 'test1@bobtail.com',
          password: 'password',
        );

        expect(signedIn, false);
      });
    });
  });
}
