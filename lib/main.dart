import 'dart:async';

import 'package:base_source_getx/app/config/app_logger.dart';
import 'package:base_source_getx/app/services/local_storage.dart';
import 'package:base_source_getx/app/util/dependency.dart';
import 'package:base_source_getx/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      DependencyCreator.init();
      WidgetsFlutterBinding.ensureInitialized();
      await initServices();
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
      runApp(App());
    },
    (error, stack) => appLogger.d(error),
  );
}

Future<void> initServices() async {
  await GetStorage.init();
  await Get.putAsync(() => LocalStorageService().init());
}
