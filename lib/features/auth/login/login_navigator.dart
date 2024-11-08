import 'package:flutter/material.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import '../onboarding/onboarding_navigator.dart';
import 'login_initial_params.dart';
import 'login_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';
import '/config/navigation/transition_type.dart';

class LoginNavigator with OnboardingRoute, HomeRoute{
  LoginNavigator(this.navigator);
  late BuildContext context;
  AppNavigator navigator;
}

mixin LoginRoute {
  openLogin(LoginInitialParams initialParams) {
    navigator.pushAndRemoveUntil(
      context: context,
      routeName: LoginPage(
        cubit: getIt(param1: initialParams), 
        dataSources: getIt()
      ),
      predicate: (route) => false,
    );
  }

  AppNavigator get navigator;
  BuildContext get context;
}
