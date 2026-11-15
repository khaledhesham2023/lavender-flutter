import 'dart:async';

import 'package:Lavender/core/di/dependency_injection.dart';
import 'package:Lavender/core/helpers/extensions.dart';
import 'package:Lavender/core/helpers/styles.dart';
import 'package:Lavender/core/localizations/app_strings.dart';
import 'package:Lavender/core/routing/routes.dart';
import 'package:Lavender/core/theming/colors_manager.dart';
import 'package:Lavender/features/intro/ui/widgets/splash_loading_widget.dart';
import 'package:Lavender/features/onboarding/data/onboarding_local_data_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/helpers/dimens_manager.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static const _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: ColorsManager.primaryColor,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );

  late final AnimationController _lottieController;
  Timer? _lottieStartTimer;
  Timer? _loadingTimer;
  Timer? _fallbackTimer;
  bool _hasStartedLottie = false;
  bool _hasStartedExit = false;
  bool _showLoading = false;

  final onboardingStore = getIt<OnboardingLocalDataStore>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle);
    _lottieController = AnimationController(vsync: this)
      ..addStatusListener(_handleAnimationStatus);

    // If the Lottie asset fails to load or never reports completion, don't
    // leave the user on the intro screen indefinitely.
    _fallbackTimer = Timer(const Duration(seconds: 8), _showLoadingAndNavigate);
  }

  void _startLottie(LottieComposition composition) {
    if (_hasStartedLottie) return;

    _hasStartedLottie = true;
    _lottieController.duration = composition.duration;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _lottieStartTimer = Timer(const Duration(milliseconds: 300), () {
        if (mounted) _lottieController.forward(from: 0);
      });
    });
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;

    _showLoadingAndNavigate();
  }

  void _showLoadingAndNavigate() {
    if (!mounted || _hasStartedExit) return;
    _hasStartedExit = true;
    _fallbackTimer?.cancel();

    setState(() => _showLoading = true);
    _loadingTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      final route = onboardingStore.isFirstTime()
          ? Routes.onboarding
          : Routes.startNow;
      context.pushReplacementNamed(route);
    });
  }

  @override
  void dispose() {
    _lottieStartTimer?.cancel();
    _loadingTimer?.cancel();
    _fallbackTimer?.cancel();
    _lottieController
      ..removeStatusListener(_handleAnimationStatus)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _systemUiOverlayStyle,
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_intro.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: DimensManager.dimens017),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.splashTitle.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.splashTitle,
                      ),
                      const SizedBox(height: DimensManager.dimens002),
                      Text(
                        AppStrings.splashSubtitle.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.splashSubtitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Lottie.asset(
                    'assets/lottie/lavender_logo.json',
                    controller: _lottieController,
                    fit: BoxFit.contain,
                    repeat: false,
                    onLoaded: _startLottie,
                  ),
                ),
                SizedBox(
                  height: DimensManager.dimens044,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: DimensManager.dimens020,
                    ),
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: _showLoading ? 1 : 0,
                        duration: const Duration(milliseconds: 150),
                        child: _showLoading
                            ? const SplashLoadingWidget()
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
