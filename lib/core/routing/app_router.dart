import 'package:flutter/material.dart';
import 'package:lavender_flutter/core/routing/routes.dart';

import '../../features/intro/ui/intro_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      default:
        return MaterialPageRoute(builder: (_) => IntroScreen());
    }
  }
}
