import '../services/storage_service.dart';

import '../app/locator.dart';

class Config {
  static var configContainer = locator<StorageService>().getBox('config');

  bool get isLoggedIn => configContainer.get(
        'isLoggedIn',
        defaultValue: false,
      );

  String get userId => Uri.decodeFull(configContainer.get(
        'userId',
      ));

  String get user => configContainer.get(
        'user',
      );

  String get primaryCacheKey {
    if (baseUrl != null && userId != null) {
      return "$baseUrl$userId";
    } else {
      return null;
    }
  }

  String get version => configContainer.get(
        'version',
      );

  String get baseUrl => configContainer.get(
        'baseUrl',
      );

  Uri get uri => Uri.parse(baseUrl);

  static Future set(String k, dynamic v) async {
    configContainer.put(k, v);
  }

  static Future clear() async {
    configContainer.clear();
  }

  static Future remove(String k) async {
    configContainer.delete(k);
  }
}
