import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/section.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/controller/baggage_cubit.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({
    super.key,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  List<Color> colors = [
    const Color.fromRGBO(71, 166, 255, 1),
    const Color.fromRGBO(50, 195, 112, 1),
    const Color.fromRGBO(242, 201, 76, 1),
    const Color.fromRGBO(235, 87, 87, 1),
    const Color.fromRGBO(242, 153, 74, 1),
    const Color.fromRGBO(155, 81, 224, 1),
    const Color.fromRGBO(66, 66, 66, 1),
    Colors.white,
  ];
  int selectedColorIndex = 0;
  double capacity = 24;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 329.h,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          Section(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.router.popForced(),
                    child: Text(
                      'Close',
                      style: titleStyle,
                    ),
                  ),
                  Text(
                    'Add baggage',
                    style: subtitleStyle.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.read<BaggageCubit>().create(
                            Baggage(
                              capacity: capacity.round(),
                              colorHex: colorToHex(colors[selectedColorIndex]),
                              content: [],
                            ),
                          );
                      context.router.popForced();
                    },
                    child: Text(
                      'Add',
                      style: titleStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: labelColor, thickness: 1),
          Section(
            children: [
              Row(
                children: [
                  Text(
                    'Luggage weight (kg)',
                    style: subtitleStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    capacity.toStringAsFixed(0),
                    style: titleStyle,
                  ),
                  Text(
                    '32',
                    style: subtitleStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoSlider(
                      divisions: 8,
                      min: 24,
                      max: 32,
                      activeColor: const Color.fromRGBO(119, 119, 119, 1),
                      thumbColor: const Color.fromRGBO(119, 119, 119, 1),
                      value: capacity,
                      onChanged: (value) {
                        setState(() => capacity = value);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Color',
                    style: subtitleStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(51, 51, 51, 1),
                        borderRadius: borderRadius,
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(colors.length, (index) {
                          return CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => setState(() {
                              selectedColorIndex = index;
                            }),
                            child: Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(51, 51, 51, 1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColorIndex == index
                                      ? Colors.white
                                      : const Color.fromRGBO(51, 51, 51, 1),
                                  width: 2.r,
                                ),
                              ),
                              child: Container(
                                height: 28.r,
                                width: 28.r,
                                decoration: BoxDecoration(
                                  color: colors[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
