import 'package:material_ui/material_ui.dart';

import 'package:Lavender/core/helpers/dimens_manager.dart';
import 'package:Lavender/core/helpers/font_family_helper.dart';
import 'package:Lavender/core/helpers/font_weight_helper.dart';
import 'package:Lavender/core/theming/colors_manager.dart';

class TextStyleHelper {
  TextStyleHelper._();

  static TextStyle get font14Bold700White => TextStyle(
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.bold,
    fontSize: DimensManager.dimens014,
    fontFamily: FontFamilyHelper.urw,
  );

  static final TextStyle splashTitle = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.elMessiri,
    fontWeight: FontWeightHelper.bold,
    fontSize: DimensManager.dimens016,
    height: 1.3,
  );

  static final TextStyle splashSubtitle = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.medium,
    fontSize: DimensManager.dimens014,
    height: 1.3,
  );

  static final TextStyle splashLoading = TextStyle(
    color: ColorsManager.white,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.semibold,
    fontSize: DimensManager.dimens018,
    height: 1.3,
  );

  static TextStyle get font20Bold700Black => TextStyle(
    color: ColorsManager.black,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.bold,
    fontSize: 20,
    height: 1.55,
  );

  static TextStyle get font14Medium500Gray5 => TextStyle(
    color: ColorsManager.gray5,
    fontFamily: FontFamilyHelper.urw,
    fontWeight: FontWeightHelper.medium,
    fontSize: 14,
    height: 1.2,
  );
}
