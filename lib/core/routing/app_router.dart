import 'package:Lavender/core/routing/routes.dart';
import 'package:Lavender/features/onboarding/ui/onboarding_screen.dart';
import 'package:Lavender/features/startNow/ui/start_now_screen.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/intro/ui/intro_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.startNow:
        return MaterialPageRoute(builder: (_) => StartNowScreen());
      default:
        return MaterialPageRoute(builder: (_) => IntroScreen());
    }
  }
}
