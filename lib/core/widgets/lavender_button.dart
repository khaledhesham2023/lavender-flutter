import 'package:flutter/material.dart';
import 'package:lavender_flutter/core/helpers/dimens_manager.dart';
import 'package:lavender_flutter/core/helpers/styles.dart';

import '../theming/colors_manager.dart';

class LavenderButton extends StatelessWidget {
  const LavenderButton({required this.action, required this.text, super.key});

  final VoidCallback action;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DimensManager.dimens016),
      child: TextButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.primaryColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, DimensManager.dimens056)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(DimensManager.dimens016)),)),
          child: Text(text, style: TextStyleHelper.font14Bold700White,)),
    );
  }
}
