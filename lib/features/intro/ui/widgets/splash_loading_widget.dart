import 'package:flutter/material.dart';
import 'package:lavender_flutter/core/helpers/dimens_manager.dart';
import 'package:lavender_flutter/core/helpers/styles.dart';

class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/splash_loader.gif',
          width: DimensManager.dimens050,
          height: DimensManager.dimens050,
        ),
        const SizedBox(width: DimensManager.dimens006),
        const Text(
          'جاري التحميل',
          style: TextStyleHelper.splashLoading,
        ),
      ],
    );
  }
}
