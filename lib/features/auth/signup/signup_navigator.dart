import 'package:flutter/material.dart';
import '../login/login_navigator.dart';
import 'signup_initial_params.dart';
import './signup_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class SignupNavigator with LoginRoute {
  SignupNavigator(this.navigator);
  @override
  late BuildContext context;
  @override
  AppNavigator navigator;
}

mixin SignupRoute {
  openSignup(SignupInitialParams initialParams) {
    navigator.push(
      context: context,
      routeName: SignupPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;
  BuildContext get context;
} 