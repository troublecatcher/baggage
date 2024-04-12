import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/router/router.dart';
import 'package:baggage/custom/custom_icon.dart';
import 'package:baggage/app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool shareable = true;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Settings',
              style: headingStyle.copyWith(fontSize: 24),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: CupertinoListSection.insetGrouped(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          dividerMargin: 0,
          additionalDividerMargin: 0,
          decoration: const BoxDecoration(
            color: surfaceColor,
          ),
          children: [
            Builder(builder: (ctx) {
              return CupertinoListTile(
                onTap: () async {
                  if (shareable) {
                    shareable = false;
                    final box = ctx.findRenderObject() as RenderBox?;
                    await Share.shareWithResult(
                      'Check out this packing assistant!',
                      sharePositionOrigin:
                          box!.localToGlobal(Offset.zero) & box.size,
                    ).whenComplete(() => shareable = true);
                  }
                },
                leading: const CustomIcon(
                  assetPath: 'assets/icons/share-all.svg',
                  mode: CustomIconMode.label,
                ),
                trailing: const CupertinoListTileChevron(),
                title: Text(
                  'Share with friends',
                  style: titleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }),
            CupertinoListTile(
              onTap: () => context.router.push(const SubscriptionRoute()),
              leading: const CustomIcon(
                assetPath: 'assets/icons/person.svg',
                mode: CustomIconMode.label,
              ),
              trailing: const CupertinoListTileChevron(),
              title: Text(
                'Subscription info',
                style: titleStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CupertinoListTile(
              onTap: () => context.router.push(const TermsOfUseRoute()),
              leading: const CustomIcon(
                assetPath: 'assets/icons/terms-of-use.svg',
                mode: CustomIconMode.label,
              ),
              trailing: const CupertinoListTileChevron(),
              title: Text(
                'Terms of Use',
                style: titleStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CupertinoListTile(
              onTap: () => context.router.push(const PrivacyPolicyRoute()),
              leading: const CustomIcon(
                assetPath: 'assets/icons/privacy-policy.svg',
                mode: CustomIconMode.label,
              ),
              trailing: const CupertinoListTileChevron(),
              title: Text(
                'Privacy Policy',
                style: titleStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
