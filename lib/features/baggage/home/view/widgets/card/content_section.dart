import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:baggage/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentSection extends StatelessWidget {
  final List<BaggageItem> content;
  const ContentSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (content.isNotEmpty) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final baggageItem = content[index];
            return Padding(
              padding: contentPadding,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          baggageItem.description,
                          style: subtitleStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      IconAndTitle(
                        text: baggageItem.category.name,
                        assetName: baggageItem.category.assetPath,
                        isTitle: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTitle(
                        text: baggageItem.quantity.toString(),
                        assetName: 'assets/icons/counter.svg',
                        isTitle: true,
                      ),
                      IconAndTitle(
                        text:
                            '${baggageItem.weight} ${baggageItem.measure.name}',
                        assetName: 'assets/icons/weight.svg',
                        isTitle: true,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: labelColor,
            thickness: 1,
          ),
          itemCount: content.length,
        );
      } else {
        return Padding(
          padding: contentPadding,
          child: Column(
            children: [
              const IconAndTitle(
                text: 'Your baggage is empty',
                assetName: 'assets/icons/alert-circle-outline.svg',
                isTitle: true,
              ),
              SizedBox(height: 10.h),
              Row(children: [
                Text(
                  'Add things to fill your baggage',
                  style: subtitleStyle,
                )
              ]),
            ],
          ),
        );
      }
    });
  }
}
