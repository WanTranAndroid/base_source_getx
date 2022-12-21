import 'dart:convert';

import 'package:base_source_getx/domain/entities/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum _Key {
  user,
}

class LocalStorageService extends GetxService {
  final _getStorage = GetStorage();

  Future<LocalStorageService> init() async {
    return this;
  }

  set user(User? value) {
    if (value != null) {
      _getStorage.write(_Key.user.toString(), json.encode(value.toJson()));
    } else {
      _getStorage.remove(_Key.user.toString());
    }
  }

  User? get user {
    final rawJson = _getStorage.read(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    final Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }
}
