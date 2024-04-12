import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconAndTitle extends StatelessWidget {
  final String text;
  final String assetName;
  final bool isTitle;
  final MainAxisAlignment? mainAxisAlignment;
  const IconAndTitle({
    super.key,
    required this.text,
    required this.assetName,
    required this.isTitle,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        CustomIcon(assetPath: assetName, mode: CustomIconMode.label),
        SizedBox(width: 4.w),
        Text(
          text,
          style: isTitle ? titleStyle : subtitleStyle,
        )
      ],
    );
  }
}
