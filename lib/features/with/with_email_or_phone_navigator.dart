import 'package:flutter/material.dart';
import 'package:flutter_template/config/navigation/transition_type.dart';
import 'package:flutter_template/features/auth/login/login_navigator.dart';
import 'package:flutter_template/features/login_with_phone/login_with_otp_navigator.dart';
import 'with_email_or_phone_initial_params.dart';
import 'with_email_or_phone_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class WithEmailOrPhoneNavigator with LoginRoute, LoginWithOtpRoute {
  WithEmailOrPhoneNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin WithEmailOrPhoneRoute {
  openWithEmailOrPhone(WithEmailOrPhoneInitialParams initialParams) {
    navigator.pushAndRemoveUntil(
        context: context,
        routeName: WithEmailOrPhonePage(
            cubit: getIt(param1: initialParams), dataSources: getIt()),
        transitionType: TransitionType.slideFromLeft,
        predicate: (route) => false);
  }

  AppNavigator get navigator;

  BuildContext get context;
}
