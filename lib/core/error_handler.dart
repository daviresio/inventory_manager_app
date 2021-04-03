import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:pedantic/pedantic.dart';

class InventoryError {
  static void recordError(Object e, StackTrace s) {
    unawaited(FirebaseCrashlytics.instance.recordError(e, s));
  }
}
