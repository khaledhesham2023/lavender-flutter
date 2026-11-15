import 'package:lavender/core/storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorageImpl implements LocalStorageService {
  SharedPrefsStorageImpl(this._preferences);
  final SharedPreferences _preferences;
  @override
  Future<void> clearAll() async {
    await _preferences.clear();
  }

  @override
  bool? getBool(String key) => _preferences.getBool(key);

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

}
