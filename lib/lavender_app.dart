import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:lavender_flutter/core/routing/app_router.dart';

import 'core/routing/routes.dart';

class LavenderApp extends StatelessWidget {
  const LavenderApp({required this.appRouter, super.key});
  
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.intro,
      onGenerateRoute: appRouter.generateRoute,
      home: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
