import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CustomIconMode { active, disabled, label }

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final CustomIconMode mode;
  const CustomIcon({super.key, required this.assetPath, required this.mode});

  @override
  Widget build(BuildContext context) {
    Color? color;
    switch (mode) {
      case CustomIconMode.active:
        color = Colors.white;
        break;
      case CustomIconMode.disabled:
        color = const Color.fromRGBO(245, 245, 245, 0.14);
        break;
      case CustomIconMode.label:
        color = const Color.fromRGBO(245, 245, 245, 0.4);
        break;
      default:
    }
    return SizedBox(
      width: 24.r,
      height: 24.r,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          color!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
