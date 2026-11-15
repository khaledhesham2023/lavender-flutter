import 'package:Lavender/core/helpers/dimens_manager.dart';
import 'package:Lavender/core/helpers/styles.dart';
import 'package:Lavender/core/localizations/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

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
