abstract class LocalStorageService {

  Future<void> setBool(String key, bool value);
  bool? getBool(String key);

  // clear one cache
  Future<void> remove(String key);

  // clear all caches
  Future<void> clearAll();
}