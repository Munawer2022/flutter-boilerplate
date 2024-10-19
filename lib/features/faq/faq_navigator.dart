import 'package:flutter/material.dart';
import 'faq_initial_params.dart';
import 'faq_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class FaqNavigator {
  FaqNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin FaqRoute {
openFaq(FaqInitialParams initialParams) {
navigator.push(
context: context,
        routeName: FaqPage(cubit: getIt(param1: initialParams))
);
}

AppNavigator get navigator;

BuildContext get context;
}
