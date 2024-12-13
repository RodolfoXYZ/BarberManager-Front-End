import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  var localStorage = FlutterSecureStorage();
  LocalStorageService();

  Future<String?> getItem(String _key) async {
    try {
      String? item = await localStorage.read(key: _key);
      return item;
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteJson() async {
    await localStorage.delete(key: 'my_json');
  }

  Future<void> saveItem(Map<String, dynamic> json, String key) async {
    await localStorage.write(key: key, value: jsonEncode(json));
  }
}
