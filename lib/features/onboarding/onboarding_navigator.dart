import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/home_navigator.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class OnboardingNavigator with HomeRoute {
  OnboardingNavigator(this.navigator);
  @override
  late BuildContext context;
  @override
  AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding(OnboardingInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: OnboardingPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
