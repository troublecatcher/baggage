import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = CupertinoThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.dark,
  barBackgroundColor: Colors.black,
  textTheme: CupertinoTextThemeData(
    textStyle: const TextStyle(
      color: Colors.white,
    ),
    navActionTextStyle: titleStyle.copyWith(fontSize: 16, inherit: false),
  ),
);

const Color surfaceColor = Color.fromRGBO(36, 36, 36, 1);
const Color labelColor = Color.fromRGBO(51, 51, 51, 1);
final BorderRadius borderRadius = BorderRadius.circular(12.r);

final TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);
final TextStyle subtitleStyle = TextStyle(
  color: const Color.fromRGBO(245, 245, 245, 0.4),
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
);
final TextStyle headingStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,
);

final contentPadding = EdgeInsets.symmetric(
  vertical: 12.h,
  horizontal: 8.w,
);
