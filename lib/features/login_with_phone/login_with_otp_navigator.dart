import 'package:flutter/material.dart';
import 'package:flutter_template/features/otp/otp_navigator.dart';
import 'login_with_otp_initial_params.dart';
import 'login_with_otp_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class LoginWithOtpNavigator with OtpRoute {
  LoginWithOtpNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin LoginWithOtpRoute {
  openLoginWithOtp(LoginWithOtpInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: LoginWithOtpPage(
            cubit: getIt(param1: initialParams), dataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
