import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';

class RemoteFilesService {
  static final _instance = firebase_storage.FirebaseStorage.instance;

  static Future<String?> saveProductImage({
    required String imagePath,
  }) async {
    try {
      var file = File(imagePath);
      var result = await _instance.ref('products/${Uuid().v4()}').putFile(file);
      var imageUrl =
          await _instance.ref(result.metadata?.fullPath).getDownloadURL();
      return imageUrl;
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      return null;
    }
  }
}
