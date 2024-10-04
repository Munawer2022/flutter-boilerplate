import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/home_navigator.dart';
import '/features/onboarding/onboarding_navigator.dart';
import '/features/splash/splash_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';
import 'splash_initial_params.dart';

class SplashNavigator with OnboardingRoute, HomeRoute {
  SplashNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin SplashRoute {
  openLogin(SplashInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: SplashPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
