import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender_flutter/core/helpers/dimens_manager.dart';
import 'package:lavender_flutter/core/theming/colors_manager.dart';

class LavenderTextField extends StatefulWidget {
  const LavenderTextField({super.key});

  @override
  State<LavenderTextField> createState() => _LavenderTextFieldState();
}

class _LavenderTextFieldState extends State<LavenderTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: DimensManager.dimens018.w, horizontal: DimensManager.dimens020.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.primaryColor)
        )
      ),
    );
  }
}
