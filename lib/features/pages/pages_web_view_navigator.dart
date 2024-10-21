import 'package:flutter/material.dart';
import 'pages_web_view_initial_params.dart';
import 'pages_web_view_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class PagesWebViewNavigator {
  PagesWebViewNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin PagesWebViewRoute {
  openPagesWebView(PagesWebViewInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: PagesWebViewPage(
            cubit: getIt(param1: initialParams), initialParams: initialParams));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
