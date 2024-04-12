import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/main.dart';
import 'package:baggage/app/router/tabs_router.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:baggage/features/baggage/home/view/layout/home_screen.dart';
import 'package:baggage/features/baggage/home/view/layout/home_wrapper_screen.dart';
import 'package:baggage/features/baggage/new/new_item_screen.dart';
import 'package:baggage/features/onboarding/onboarding_screen.dart';
import 'package:baggage/features/settings/privacy_policy_screen.dart';
import 'package:baggage/features/settings/promotion_screen.dart';
import 'package:baggage/features/settings/settings_screen.dart';
import 'package:baggage/features/settings/subscription_screen.dart';
import 'package:baggage/features/settings/terms_of_use_screen.dart';
import 'package:flutter/cupertino.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: isFirstTime! && !showPromotion,
        ),
        AutoRoute(
          page: TabBarRoute.page,
          initial: !isFirstTime! && !showPromotion,
          children: [
            AutoRoute(
              page: HomeWrapperRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(page: NewItemRoute.page),
              ],
            ),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: PromotionRoute.page, initial: showPromotion),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: SubscriptionRoute.page),
      ];
}
