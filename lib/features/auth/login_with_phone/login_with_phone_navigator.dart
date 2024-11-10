import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/otp/otp_navigator.dart';
import 'login_with_phone_initial_params.dart';
import 'login_with_phone_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class LoginWithPhoneNavigator with OtpRoute {
  LoginWithPhoneNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin LoginWithPhoneRoute {
  openLoginWithPhone(LoginWithPhoneInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: LoginWithPhonePage(
            cubit: getIt(param1: initialParams), dataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
