import 'package:Lavender/core/storage/local_storage_service.dart';
import 'package:Lavender/core/storage/shared_prefs_storage_impl.dart';
import 'package:Lavender/features/onboarding/data/onboarding_local_data_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setDependencies() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<LocalStorageService>(() => SharedPrefsStorageImpl(preferences));
  getIt.registerLazySingleton<OnboardingLocalDataStore>(() => OnboardingLocalDataStore(getIt<LocalStorageService>()));
}