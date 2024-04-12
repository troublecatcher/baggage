import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/custom/measures.dart';
import 'package:baggage/custom/section.dart';
import 'package:baggage/custom/section_with_title.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/controller/baggage_cubit.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:baggage/features/baggage/home/model/baggage_item_category/baggage_item_category.dart';
import 'package:baggage/features/baggage/home/model/measure/measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewItemScreen extends StatefulWidget {
  final Baggage baggage;
  final BaggageItem? baggageItem;
  const NewItemScreen({super.key, required this.baggage, this.baggageItem});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> with AfterLayoutMixin {
  late TextEditingController descriptionController;
  late TextEditingController quantityController;
  late FixedExtentScrollController scrollController;
  int selectedCategoryIndex = 0;
  Measure measure = Measure.kg;
  int weight = 1;
  late int availableWeight;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    quantityController = TextEditingController();
    scrollController = FixedExtentScrollController();
    int currentWeightInGrams = totalWeight(widget.baggage);
    availableWeight = widget.baggage.capacity * 1000 - currentWeightInGrams;
    if (availableWeight ~/ 1000 == 0) {
      measure = Measure.gram;
      weight = 100;
    }

    if (widget.baggageItem != null) {
      descriptionController.text = widget.baggageItem!.description;
      quantityController.text = widget.baggageItem!.quantity.toString();
      selectedCategoryIndex =
          BaggageItemCategory.values.indexOf(widget.baggageItem!.category);
      measure = widget.baggageItem!.measure;
      weight = widget.baggageItem!.weight;
      availableWeight = (widget.baggageItem!.measure == Measure.kg
              ? widget.baggageItem!.weight * 1000
              : widget.baggageItem!.weight) +
          (widget.baggage.capacity * 1000 - currentWeightInGrams);
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.baggageItem != null) {
      scrollController.animateToItem(
        measure == Measure.kg
            ? widget.baggageItem!.weight - 1
            : (widget.baggageItem!.weight - 1) ~/ 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool condition = false;
    if (descriptionController.text.isNotEmpty) {
      if (quantityController.text.isNotEmpty) {
        if (quantityController.text.length <= 6) {
          if (int.tryParse(quantityController.text) != null) {
            condition = true;
          }
        }
      }
    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          previousPageTitle: 'Back',
          middle: const Text('Add things'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: condition
                ? () {
                    final cubit = context.read<BaggageCubit>();
                    if (widget.baggageItem != null) {
                      final baggageIndex = cubit.state.indexOf(widget.baggage);
                      final baggageItemIndex = cubit.state[baggageIndex].content
                          .indexOf(widget.baggageItem!);
                      cubit.updateItem(
                        baggageIndex: baggageIndex,
                        baggageItemIndex: baggageItemIndex,
                        baggageItem: BaggageItem(
                          description: descriptionController.text,
                          category:
                              BaggageItemCategory.values[selectedCategoryIndex],
                          quantity: int.parse(quantityController.text),
                          weight: weight,
                          measure: measure,
                        ),
                      );
                    } else {
                      cubit.addItem(
                        cubit.state.indexOf(widget.baggage),
                        BaggageItem(
                          description: descriptionController.text,
                          category:
                              BaggageItemCategory.values[selectedCategoryIndex],
                          quantity: int.parse(quantityController.text),
                          weight: weight,
                          measure: measure,
                        ),
                      );
                    }
                    context.router.popForced();
                  }
                : null,
            child: Text(
              'Done',
              style: condition
                  ? titleStyle.copyWith(fontSize: 16)
                  : subtitleStyle.copyWith(fontSize: 16),
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SectionWithTitle(
                title: 'Description',
                child: CupertinoTextField(
                  style: titleStyle,
                  placeholderStyle: subtitleStyle,
                  controller: descriptionController,
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: borderRadius,
                  ),
                  placeholder: 'What do you want to take?',
                  maxLines: 3,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              SizedBox(height: 16.h),
              SectionWithTitle(
                title: 'Category',
                child: Wrap(
                  spacing: 8.r,
                  runSpacing: 8.r,
                  children:
                      List.generate(BaggageItemCategory.values.length, (index) {
                    final category = BaggageItemCategory.values[index];
                    final condition = selectedCategoryIndex == index;
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          setState(() => selectedCategoryIndex = index),
                      child: Container(
                        padding: contentPadding,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: surfaceColor,
                          border: Border.all(
                            color: condition ? Colors.white : surfaceColor,
                            width: 1,
                          ),
                        ),
                        child: FittedBox(
                          child: Row(
                            children: [
                              IconAndTitle(
                                text: category.name,
                                assetName: category.assetPath,
                                isTitle: condition,
                              ),
                              if (condition)
                                Row(
                                  children: [
                                    SizedBox(width: 10.w),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: SizedBox(
                                        width: 24.r,
                                        height: 24.r,
                                        child: const Icon(
                                          Icons.done,
                                          color: surfaceColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16.h),
              SectionWithTitle(
                title: 'Quantity',
                child: CupertinoTextField(
                  style: titleStyle,
                  placeholderStyle: subtitleStyle,
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  prefix: Padding(
                    padding: contentPadding,
                    child: const CustomIcon(
                        assetPath: 'assets/icons/counter.svg',
                        mode: CustomIconMode.label),
                  ),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: borderRadius,
                  ),
                  placeholder: 'Number of things',
                  onChanged: (_) => setState(() {}),
                ),
              ),
              SizedBox(height: 16.h),
              Section(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weight: $weight ${measure.name}',
                            style: subtitleStyle,
                          ),
                          if (availableWeight ~/ 1000 != 0)
                            CupertinoSlidingSegmentedControl(
                              groupValue: Measure.values.indexOf(measure),
                              children: Map.fromEntries(
                                Measure.values.asMap().entries.map(
                                  (entry) {
                                    final index = entry.key;
                                    final m = entry.value;
                                    return MapEntry(
                                      index,
                                      Text(
                                        m.name,
                                        style:
                                            Measure.values.indexOf(measure) ==
                                                    index
                                                ? titleStyle
                                                : subtitleStyle,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              onValueChanged: (value) => setState(() {
                                switch (Measure.values[value as int]) {
                                  case Measure.kg:
                                    weight = weight ~/ 1000;

                                    break;
                                  case Measure.gram:
                                    weight = weight * 1000;
                                    break;
                                }
                                measure = Measure.values[value];
                                scrollController.animateToItem(
                                  measure == Measure.kg
                                      ? weight - 1
                                      : (weight - 1) ~/ 100,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                );
                              }),
                            ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 240.h,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius, color: surfaceColor),
                        child: CupertinoPicker.builder(
                          scrollController: scrollController,
                          childCount: measure == Measure.kg
                              ? availableWeight ~/ 1000
                              : availableWeight ~/ 100,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomIcon(
                                    assetPath: 'assets/icons/weight.svg',
                                    mode: CustomIconMode.label),
                                Text(
                                  ((index + 1) *
                                          (measure == Measure.kg ? 1 : 100))
                                      .toString(),
                                  style: titleStyle,
                                ),
                              ],
                            );
                          },
                          itemExtent: 34.h,
                          onSelectedItemChanged: (value) => setState(() =>
                              weight = (value + 1) *
                                  (measure == Measure.kg ? 1 : 100)),
                        ),
                      ),
                      if (widget.baggageItem != null)
                        Column(
                          children: [
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CupertinoButton(
                                    color: surfaceColor,
                                    child: Text(
                                      'Delete',
                                      style: titleStyle,
                                    ),
                                    onPressed: () => showCupertinoDialog(
                                      useRootNavigator: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        baggage: widget.baggage,
                                        baggageItem: widget.baggageItem!,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      SizedBox(height: 31.h),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class AlertDialog extends StatelessWidget {
  final Baggage baggage;
  final BaggageItem baggageItem;
  const AlertDialog({
    super.key,
    required this.baggage,
    required this.baggageItem,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Are you sure?'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => context.router.popForced(),
          isDefaultAction: true,
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            final cubit = context.read<BaggageCubit>();
            final baggageIndex = cubit.state.indexOf(baggage);
            final baggageItemIndex =
                cubit.state[baggageIndex].content.indexOf(baggageItem);
            cubit.deleteItem(
              baggageIndex: baggageIndex,
              baggageItemIndex: baggageItemIndex,
            );
            context.router
              ..popForced()
              ..popForced();
          },
          isDestructiveAction: true,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
