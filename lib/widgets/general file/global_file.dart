import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';
import '../services/storage_service_controller.dart';

class GlobalFile {
  static late StorageServiceController storageServiceController;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageServiceController = await StorageServiceController().init();
  }
}
