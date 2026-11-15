import 'package:Lavender/core/helpers/dimens_manager.dart';
import 'package:Lavender/core/helpers/styles.dart';
import 'package:material_ui/material_ui.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleHelper.font20Bold700Black,
        ),
        const SizedBox(height: DimensManager.dimens010),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyleHelper.font14Medium500Gray5,
        ),
      ],
    );
  }
}
