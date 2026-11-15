import 'package:Lavender/core/di/dependency_injection.dart';
import 'package:Lavender/core/helpers/dimens_manager.dart';
import 'package:Lavender/core/helpers/extensions.dart';
import 'package:Lavender/core/localizations/app_strings.dart';
import 'package:Lavender/core/routing/routes.dart';
import 'package:Lavender/core/theming/colors_manager.dart';
import 'package:Lavender/core/widgets/custom_page_indicator.dart';
import 'package:Lavender/core/widgets/lavender_button.dart';
import 'package:Lavender/core/widgets/vertical_spacer.dart';
import 'package:Lavender/features/onboarding/data/onboarding_local_data_store.dart';
import 'package:Lavender/features/onboarding/ui/widgets/onboarding_page_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
  );

  static final _titleKeys = [
    AppStrings.onboardingTitle1.tr(),
    AppStrings.onboardingTitle2.tr(),
    AppStrings.onboardingTitle3.tr(),
  ];

  static final _subtitleKeys = [
    AppStrings.onboardingSubtitle1.tr(),
    AppStrings.onboardingSubtitle2.tr(),
    AppStrings.onboardingSubtitle3.tr(),
  ];

  int _activeIndex = 0;

  final onboardingStore = getIt.call<OnboardingLocalDataStore>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle);
  }

  String _animationPath(String languageCode) {
    // Keep the existing asset spelling: "onboarding".
    return 'assets/lottie/onboarding_${_activeIndex + 1}_$languageCode.json';
  }

  void _handleContinue() async {
    if (_activeIndex < 2) {
      setState(() => _activeIndex++);
      return;
    }
    await onboardingStore.setIsFirstTime(false);
    // ignore: use_build_context_synchronously
    context.pushReplacementNamed(Routes.startNow);
  }

  @override
  Widget build(BuildContext context) {
    // TODO replace this line by getter_function from shared preferences
    final languageCode = context.locale.languageCode;
    final animationPath = _animationPath(languageCode);
    final buttonKey = _activeIndex == 2
        ? AppStrings.startNow.tr()
        : AppStrings.next.tr();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _systemUiOverlayStyle,
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: Builder(
          builder: (context) {
            return Column(
              children: [
                Expanded(
                  flex: 70,
                  child: LayoutBuilder(
                    builder: (context, artConstraints) {
                      return Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: DimensManager.dimens006.h,
                            height: DimensManager.dimens490.h,
                            child: Lottie.asset(
                              animationPath,
                              key: ValueKey(animationPath),
                              fit: BoxFit.contain,
                              repeat: false,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: (_activeIndex == 0
                                ? DimensManager.dimens214.h
                                : DimensManager.dimens234.h),
                            height: DimensManager.dimens266.h,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.018, 0.456, 0.955],
                                  colors: [
                                    ColorsManager.white.withValues(alpha: 0),
                                    ColorsManager.white.withValues(alpha: 0.6),
                                    ColorsManager.white,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                VerticalSpacer(value: DimensManager.dimens025),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: DimensManager.dimens016.w,
                  ),
                  child: OnboardingPageContent(
                    title: _titleKeys[_activeIndex].tr(),
                    subtitle: _subtitleKeys[_activeIndex].tr(),
                  ),
                ),
                VerticalSpacer(value: DimensManager.dimens050),
                CustomPageIndicator(activeIndex: _activeIndex),
                const Spacer(flex: 10),
                LavenderButton(action: _handleContinue, text: buttonKey.tr()),
                VerticalSpacer(value: DimensManager.dimens016),
              ],
            );
          },
        ),
      ),
    );
  }
}
