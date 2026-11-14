import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:lavender_flutter/core/helpers/dimens_manager.dart';
import 'package:lavender_flutter/core/helpers/styles.dart';
import 'package:lavender_flutter/core/localizations/app_strings.dart';

class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.splashLoading.tr(),
          style: TextStyleHelper.splashLoading,
        ),
        const SizedBox(width: DimensManager.dimens006),
        Image.asset(
          'assets/images/splash_loader.gif',
        ),
      ],
    );
  }
}
