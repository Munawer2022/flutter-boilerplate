import 'package:flutter/material.dart';
import 'package:flutter_template/config/navigation/transition_type.dart';
import 'package:flutter_template/features/auth/login/login_navigator.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import 'package:flutter_template/features/auth/with_email_or_phone/with_email_or_phone_navigator.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_page.dart';
import '../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class OnboardingNavigator with WithEmailOrPhoneRoute {
  OnboardingNavigator(this.navigator);
  @override
  late BuildContext context;
  @override
  AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding(OnboardingInitialParams initialParams) {
    navigator.pushAndRemoveUntil(
        context: context,
        routeName: OnboardingPage(
            cubit: getIt(param1: initialParams), dataSources: getIt()),
        transitionType: TransitionType.slideFromRight,
        predicate: (route) => false);
  }

  AppNavigator get navigator;

  BuildContext get context;
}
