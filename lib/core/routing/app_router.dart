import 'package:lavender_flutter/features/onboarding/ui/onboarding_screen.dart';
import 'package:material_ui/material_ui.dart';
import 'package:lavender_flutter/core/routing/routes.dart';

import '../../features/intro/ui/intro_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(builder: (_) => IntroScreen());
    }
  }
}
