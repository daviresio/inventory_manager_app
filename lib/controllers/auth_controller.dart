import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/core/error_handler.dart';
import 'package:inventory_manager/services/auth_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChange;
});

var token;

Future<void> loginOrCreateUserByMail({
  required String email,
  required String password,
}) async {
  var result = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  if (result.isEmpty) {
    await createUserByEmail(email: email, password: password);
  } else {
    await loginByEmail(email: email, password: password);
    token = await FirebaseAuth.instance.currentUser!.getIdToken();
    print(token);
  }
}

Future<void> createUserByEmail({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } catch (e, s) {
    InventoryError.recordError(e, s);
  }
}

Future<void> loginByEmail({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(await FirebaseAuth.instance.currentUser!.getIdToken());
  } catch (e, s) {
    InventoryError.recordError(e, s);
  }
}

Future<void> logout() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e, s) {
    InventoryError.recordError(e, s);
  }
}
