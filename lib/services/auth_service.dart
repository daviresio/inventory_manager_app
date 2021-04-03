import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'login successfull';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'signup successfull';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
