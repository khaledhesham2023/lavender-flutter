import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/helpers/dimens_manager.dart';
import 'package:lavender/core/helpers/extensions.dart';
import 'package:lavender/core/helpers/styles.dart';
import 'package:lavender/core/localizations/app_strings.dart';
import 'package:lavender/core/routing/routes.dart';
import 'package:lavender/core/theming/colors_manager.dart';
import 'package:lavender/core/widgets/lavender_button.dart';
import 'package:lottie/lottie.dart';
import 'package:material_ui/material_ui.dart';

class StartNowScreen extends StatelessWidget {
  const StartNowScreen({super.key});

  static const _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: ColorsManager.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _systemUiOverlayStyle,
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Lottie.asset(
                  'assets/lottie/start.json',
                  fit: BoxFit.contain,
                  repeat: false,
                ),
              ),
              SizedBox(height: DimensManager.dimens040.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DimensManager.dimens016.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.startNowTitle.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.font20Bold700Black,
                    ),
                    SizedBox(height: DimensManager.dimens010.h),
                    Text(
                      AppStrings.startNowSubtitle.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.font14Medium500Gray4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: DimensManager.dimens057.h),
              const _StartNowActions(),
              SizedBox(height: DimensManager.dimens038.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartNowActions extends StatelessWidget {
  const _StartNowActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LavenderButton(
          action: () => context.push(Routes.register),
          text: AppStrings.register.tr(),
        ),
        SizedBox(height: DimensManager.dimens016.h),
        LavenderButton(
          action: () => context.push(Routes.login),
          text: AppStrings.login.tr(),
          backgroundColor: ColorsManager.white,
          borderColor: ColorsManager.primaryColor,
          borderWidth: DimensManager.dimens001.w,
          textColor: ColorsManager.primaryColor,
        ),
        SizedBox(height: DimensManager.dimens020.h),
        const _OrYouCanDivider(),
        SizedBox(height: DimensManager.dimens024.h),
        const _ContinueAsGuestLabel(),
      ],
    );
  }
}

class _OrYouCanDivider extends StatelessWidget {
  const _OrYouCanDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens016.w),
      child: Row(
        children: [
          const Expanded(child: _SeparatorLine()),
          SizedBox(width: DimensManager.dimens010.w),
          Text(
            AppStrings.orYouCan.tr(),
            style: TextStyleHelper.font14Medium500Gray4,
          ),
          SizedBox(width: DimensManager.dimens010.w),
          const Expanded(child: _SeparatorLine()),
        ],
      ),
    );
  }
}

class _SeparatorLine extends StatelessWidget {
  const _SeparatorLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensManager.dimens001.h,
      color: ColorsManager.gray2,
    );
  }
}

class _ContinueAsGuestLabel extends StatelessWidget {
  const _ContinueAsGuestLabel();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: DimensManager.dimens024,
          child: Lottie.asset(
            'assets/lottie/lottie_auth_guest_eyes.json',
            fit: BoxFit.contain,
            repeat: true,
          ),
        ),
        SizedBox(width: DimensManager.dimens006.w),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.home);
    },
    child: Text(AppStrings.continueAsGuest.tr(),
          style: TextStyleHelper.font14Medium500Primary.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
    )]);
  }
}
