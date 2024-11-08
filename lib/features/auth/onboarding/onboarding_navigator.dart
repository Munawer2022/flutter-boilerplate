import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/login/login_navigator.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';
import 'package:flutter_template/features/auth/login/login_initial_params.dart';
import 'package:flutter_template/features/auth/login/login_page.dart';

class OnboardingNavigator with HomeRoute, LoginRoute {
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
        routeName: OnboardingPage(
            cubit: getIt(param1: initialParams), dataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
