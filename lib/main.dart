
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'core/routing/app_router.dart';
import 'lavender_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en','US'),Locale('ar','SA')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar','SA'),
      startLocale: Locale('ar','SA'),
      child: LavenderApp(appRouter: AppRouter())));
}
