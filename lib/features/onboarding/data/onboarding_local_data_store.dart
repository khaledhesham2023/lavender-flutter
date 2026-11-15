import 'package:lavender/core/storage/local_storage_service.dart';
import 'package:lavender/core/storage/preferences_keys.dart';

class OnboardingLocalDataStore {
  OnboardingLocalDataStore(this._storageService);

  final LocalStorageService _storageService;

  bool isFirstTime() => _storageService.getBool(PreferencesKeys.isFirstTime) ?? true;

  Future<void> setIsFirstTime(bool value) async {
    await _storageService.setBool(PreferencesKeys.isFirstTime, value);
  }

}