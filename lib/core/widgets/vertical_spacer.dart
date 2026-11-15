import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacer extends StatelessWidget {
  const new({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value.w) ;
  }
}