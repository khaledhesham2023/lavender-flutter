import 'package:lavender/core/routing/routes.dart';
import 'package:lavender/features/home/home_screen.dart';
import 'package:lavender/features/login/ui/login_screen.dart';
import 'package:lavender/features/onboarding/ui/onboarding_screen.dart';
import 'package:lavender/features/register/ui/register_screen.dart';
import 'package:lavender/features/startNow/ui/start_now_screen.dart';
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
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => IntroScreen());
    }
  }
}
