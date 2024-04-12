import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/router/router.dart';
import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/custom_icon_row.dart';
import 'package:baggage/custom/measures.dart';
import 'package:baggage/custom/util.dart';
import 'package:baggage/features/baggage/home/controller/baggage_cubit.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtons extends StatelessWidget {
  final Baggage baggage;
  const ActionButtons({super.key, required this.baggage});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (baggage.capacity * 1000 - totalWeight(baggage) >= 100)
            Expanded(
              child: CupertinoButton(
                padding: contentPadding,
                onPressed: () =>
                    context.router.push(NewItemRoute(baggage: baggage)),
                child: const IconAndTitle(
                  text: 'Add things',
                  assetName: 'assets/icons/plus-circle-outline.svg',
                  isTitle: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          if (baggage.capacity * 1000 - totalWeight(baggage) >= 100)
            VerticalDivider(
              color: labelColor,
              thickness: 2.r,
            ),
          Expanded(
            child: CupertinoButton(
              padding: contentPadding,
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => ActionSheet(baggage: baggage),
              ),
              child: const IconAndTitle(
                text: 'Edit',
                assetName: 'assets/icons/square-edit-outline.svg',
                isTitle: true,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionSheet extends StatelessWidget {
  final Baggage baggage;
  const ActionSheet({
    super.key,
    required this.baggage,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Select the item you\'d like to edit'),
      actions: [
        ...List.generate(baggage.content.length, (index) {
          final baggageItem = baggage.content[index];
          return CupertinoActionSheetAction(
            onPressed: () => context.router
              ..popForced()
              ..push(
                NewItemRoute(baggage: baggage, baggageItem: baggageItem),
              ),
            child: Text(baggageItem.description),
          );
        }),
        CupertinoActionSheetAction(
          onPressed: () {
            context.router.popForced();
            showCupertinoDialog(
              context: context,
              builder: (context) => AlertDialog(baggage: baggage),
            );
          },
          isDestructiveAction: true,
          child: const Text('Delete this baggage list'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => context.router.popForced(),
        isDefaultAction: true,
        child: const Text('Cancel'),
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  final Baggage baggage;
  const AlertDialog({
    super.key,
    required this.baggage,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Are you sure?'),
      content: const Text(
          'Deleting this baggage list will also wipe all created items inside of it'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => context.router.popForced(),
          isDefaultAction: true,
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            final cubit = context.read<BaggageCubit>();
            cubit.delete(cubit.state.indexOf(baggage));
            context.router.popForced();
          },
          isDestructiveAction: true,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
