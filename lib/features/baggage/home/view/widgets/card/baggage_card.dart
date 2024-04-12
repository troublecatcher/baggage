import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/action_buttons.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/content_section.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/summary_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaggageCard extends StatelessWidget {
  final Baggage baggage;

  const BaggageCard({
    super.key,
    required this.baggage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: hexToColor(baggage.colorHex),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 8.w,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 24.r,
                  height: 24.r,
                  child: SvgPicture.asset(
                    'assets/icons/content-paste.svg',
                    colorFilter: ColorFilter.mode(
                      baggage.colorHex != colorToHex(Colors.white)
                          ? Colors.white
                          : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Baggage list',
                  style: baggage.colorHex != colorToHex(Colors.white)
                      ? titleStyle
                      : titleStyle.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: Column(
            children: [
              ContentSection(content: baggage.content),
              const Divider(
                color: labelColor,
                height: 0,
              ),
              SummarySection(baggage: baggage),
              Divider(
                color: labelColor,
                thickness: 2.r,
                height: 0,
              ),
              ActionButtons(
                baggage: baggage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
