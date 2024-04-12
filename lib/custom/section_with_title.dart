import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWithTitle({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Section(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: subtitleStyle,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            child,
          ],
        )
      ],
    );
  }
}
