import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/custom/section.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/controller/baggage_cubit.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/action_buttons.dart';
import 'package:baggage/features/baggage/home/view/widgets/bottom_sheet_content.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/baggage_card.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/content_section.dart';
import 'package:baggage/features/baggage/home/view/widgets/card/summary_section.dart';
import 'package:baggage/features/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Packed suitcases',
              style: headingStyle.copyWith(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CupertinoButton(
                borderRadius: borderRadius,
                color: surfaceColor,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Add baggage',
                  style: titleStyle.copyWith(fontSize: 16),
                ),
                onPressed: () async => await _displayBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: BlocBuilder<BaggageCubit, List<Baggage>>(
          builder: (context, state) {
            if (state.isNotEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Section(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Your baggage',
                              style: subtitleStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                  SliverList.separated(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final baggage = state[index];
                      return Section(
                        children: [
                          BaggageCard(baggage: baggage),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              const IconAndTitle(
                                text: 'Baggage',
                                assetName: 'assets/icons/bag-suitcase.svg',
                                isTitle: false,
                              ),
                              SizedBox(width: 20.w),
                              IconAndTitle(
                                text: baggage.capacity.toString(),
                                assetName: 'assets/icons/weight.svg',
                                isTitle: false,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 16.h),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(
                  'No baggage added yet',
                  style: titleStyle,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      builder: (context) => const BottomSheetContent(),
    );
  }
}
