import 'package:flutter/material.dart';
import 'package:lavender_flutter/core/helpers/dimens_manager.dart';
import 'package:lavender_flutter/core/helpers/font_family_helper.dart';
import 'package:lavender_flutter/core/helpers/font_weight_helper.dart';
import 'package:lavender_flutter/core/theming/colors_manager.dart';

/// Naming conventions:
/// font + fontSize + weight + fontWeight + color
/// e.g: we have a text and we want to give it a style
/// font size is 16, weight is 600, color is lavender (colorPrimary)
/// variable name will be font16WeightSemiboldPrimary
/// and so on...
///
/// colors dependent on [ColorsManager]
/// weights dependent on [FontWeightHelper]
///
/// TODO here we can add custom textStyles according to design

class TextStyleHelper {
  static const TextStyle font14Bold700White = TextStyle(
      color: ColorsManager.white,
      fontWeight: FontWeightHelper.bold,
      fontSize: DimensManager.dimens014,
  );

  static const TextStyle splashTitle = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.elMessiri,
    fontWeight: FontWeightHelper.bold,
    fontSize: DimensManager.dimens016,
    height: 1.3
  );

  static const TextStyle splashSubtitle = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.medium,
    fontSize: DimensManager.dimens014,
    height: 1.3,
  );

  static const TextStyle splashBrandName = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.bold,
    fontSize: DimensManager.dimens013,
    letterSpacing: 0.2,
    height: 1.2,
  );

  static const TextStyle splashBrandServices = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.medium,
    fontSize: DimensManager.dimens009,
    letterSpacing: 0.25,
    height: 1.2,
  );

  static const TextStyle splashLoading = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.semibold,
    fontSize: DimensManager.dimens018,
    height: 1.3,
  );
}


