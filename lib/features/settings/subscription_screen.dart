import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:baggage/app/main.dart';

@RoutePage()
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Subscription'),
      ),
      child: SafeArea(
        bottom: false,
        child: subscription != null && subscription != ''
            ? InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(subscription!),
                ),
              )
            : const Center(
                child: Text('Failed to load subscription info'),
              ),
      ),
    );
  }
}
