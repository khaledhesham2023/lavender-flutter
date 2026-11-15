import 'package:Lavender/core/helpers/dimens_manager.dart';
import 'package:Lavender/core/helpers/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

import '../theming/colors_manager.dart';

class LavenderButton extends StatelessWidget {
  const LavenderButton({required this.action, required this.text, super.key});

  final VoidCallback action;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens016.w),
      child: TextButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.primaryColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            Size(double.infinity, DimensManager.dimens056.h),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DimensManager.dimens016.r),
            ),
          ),
        ),
        child: Text(text, style: TextStyleHelper.font14Bold700White),
      ),
    );
  }
}
