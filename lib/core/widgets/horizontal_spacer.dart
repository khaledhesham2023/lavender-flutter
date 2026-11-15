import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpacer extends StatelessWidget {
  const new({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value.h) ;
  }
}