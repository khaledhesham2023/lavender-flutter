import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavender/core/helpers/dimens_manager.dart';
import 'package:lavender/core/theming/colors_manager.dart';
import 'package:lavender/core/widgets/horizontal_spacer.dart';
import 'package:material_ui/material_ui.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    this.count = 3,
    required this.activeIndex,
    super.key,
  });

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < count; index++) ...[
          if (index > 0) HorizontalSpacer(value: DimensManager.dimens006),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeInOut,
            width: (index == activeIndex ? DimensManager.dimens023 : DimensManager.dimens008).w,
            height: DimensManager.dimens008.h,
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? ColorsManager.primaryColor
                  : ColorsManager.gray1,
              borderRadius: BorderRadius.circular(DimensManager.dimens050.r),
            ),
          ),
        ],
      ],
    );
  }
}
