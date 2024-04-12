import 'package:auto_route/auto_route.dart';
import 'package:baggage/app/main.dart';
import 'package:baggage/app/router/router.dart';
import 'package:baggage/app/theme.dart';
import 'package:baggage/custom/section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/suitcase.png',
              width: MediaQuery.of(context).size.width * 1.5,
              height: MediaQuery.of(context).size.height / 1.5,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, 0.4),
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              )),
              child: Section(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome to your personal travel packing assistant!',
                    style: headingStyle,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Create your luggage checklist in a few simple steps and travel with confidence and convenience.',
                    style: subtitleStyle,
                  ),
                  SizedBox(height: 56.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          borderRadius: borderRadius,
                          color: surfaceColor,
                          onPressed: () {
                            locator<SharedPreferences>()
                                .setBool('isFirstTime', false);
                            context.router.replace(const HomeRoute());
                          },
                          child: Text(
                            'Get started',
                            style: titleStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Terms of Use',
                          style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        onPressed: () =>
                            context.router.push(const TermsOfUseRoute()),
                      ),
                      Text(
                        ' / ',
                        style: subtitleStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Privacy Policy',
                          style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        onPressed: () =>
                            context.router.push(const PrivacyPolicyRoute()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
