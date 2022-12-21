import 'package:base_source_getx/app/lang/en_us.dart';
import 'package:base_source_getx/app/lang/vi_vn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  // static Locale? get locale => Get.deviceLocale;
  static Locale? get locale => const Locale('vi');
  static const fallbackLocale = Locale('vi', 'VN');

  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi_vn,
        'en_US': en_us,
      };
}
