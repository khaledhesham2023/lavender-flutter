import 'package:lavender/core/storage/local_storage_service.dart';
import 'package:lavender/core/storage/preferences_keys.dart';

class HomeLocalDataStore {
  HomeLocalDataStore(this._storageService);

  final LocalStorageService _storageService;

  bool isGuest() => _storageService.getBool(PreferencesKeys.isGuest) ?? true;

  Future<void> setIsGuest(bool value) async {
    await _storageService.setBool(PreferencesKeys.isGuest, value);
  }

}