import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/custom/measures.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummarySection extends StatelessWidget {
  final Baggage baggage;
  const SummarySection({super.key, required this.baggage});

  @override
  Widget build(BuildContext context) {
    int weight = totalWeight(baggage);
    return Padding(
      padding: contentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total weight',
            style: subtitleStyle.copyWith(fontSize: 14.sp),
          ),
          Row(
            children: [
              Row(
                children: [
                  const CustomIcon(
                      assetPath: 'assets/icons/weight.svg',
                      mode: CustomIconMode.label),
                  SizedBox(width: 4.w),
                  Text(
                    '${weight ~/ 1000} kg',
                    style: subtitleStyle.copyWith(fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(width: 8.w),
              Row(
                children: [
                  const CustomIcon(
                      assetPath: 'assets/icons/weight.svg',
                      mode: CustomIconMode.label),
                  SizedBox(width: 4.w),
                  Text(
                    '${weight % 1000} grams',
                    style: subtitleStyle.copyWith(fontSize: 14.sp),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
