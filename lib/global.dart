import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'common/services/storage_services.dart';

class Global {
  static late StorageServices storageService;

  static Future<dynamic> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageService = await StorageServices().init();
  }
}
