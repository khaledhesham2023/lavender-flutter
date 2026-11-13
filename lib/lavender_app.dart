import 'package:flutter/material.dart';
import 'package:lavender_flutter/core/routing/app_router.dart';
import 'package:lavender_flutter/core/widgets/lavender_button.dart';
import 'package:lavender_flutter/core/widgets/lavender_text_field.dart';

import 'core/routing/routes.dart';

class LavenderApp extends StatelessWidget {
  const LavenderApp({required this.appRouter, super.key});
  
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
