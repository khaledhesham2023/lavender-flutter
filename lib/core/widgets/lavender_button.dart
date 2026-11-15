import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/helpers/dimens_manager.dart';
import 'package:lavender/core/helpers/styles.dart';
import 'package:material_ui/material_ui.dart';

import '../theming/colors_manager.dart';

class LavenderButton extends StatelessWidget {
  final VoidCallback action;

  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final Color? textColor;
  const LavenderButton({
    required this.action,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = textColor ??
        (backgroundColor == ColorsManager.white
            ? ColorsManager.primaryColor
            : ColorsManager.white);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens016.w),
      child: TextButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            backgroundColor ?? ColorsManager.primaryColor,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            Size(double.infinity, DimensManager.dimens056.h),
          ),
          side: WidgetStateProperty.all(
            borderColor != null && borderWidth > 0
                ? BorderSide(color: borderColor!, width: borderWidth)
                : BorderSide.none,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DimensManager.dimens016.r),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyleHelper.font14Bold700White.copyWith(
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
