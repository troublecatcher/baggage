import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/router/router.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:baggage/app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.black,
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          border: null,
          backgroundColor: surfaceColor,
          activeColor: Colors.white,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetPath: 'assets/icons/bag-carry-on.svg',
                mode: CustomIconMode.disabled,
              ),
              activeIcon: CustomIcon(
                assetPath: 'assets/icons/bag-carry-on.svg',
                mode: CustomIconMode.active,
              ),
              label: 'Baggage',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                assetPath: 'assets/icons/cogs.svg',
                mode: CustomIconMode.disabled,
              ),
              activeIcon: CustomIcon(
                assetPath: 'assets/icons/cogs.svg',
                mode: CustomIconMode.active,
              ),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
