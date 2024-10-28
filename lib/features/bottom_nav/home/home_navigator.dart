import 'package:flutter/material.dart';
import 'home_initial_params.dart';
import 'home_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class HomeNavigator {
  HomeNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin HomeRoute {
  openHome(HomeInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: HomePage(cubit: getIt(param1: initialParams)));
    // navigator.pushAndRemoveUntil(
    //     context: context,
    //     routeName: HomePage(cubit: getIt(param1: initialParams)),
    //     predicate: (route) => false);
  }

  AppNavigator get navigator;

  BuildContext get context;
}