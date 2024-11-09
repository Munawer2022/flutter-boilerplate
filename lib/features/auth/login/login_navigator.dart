import 'package:flutter/material.dart';
import 'package:flutter_template/config/navigation/transition_type.dart';
import 'package:flutter_template/features/auth/splash/splash_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import 'package:flutter_template/features/sign/sign_up_navigator.dart';
import 'login_initial_params.dart';
import 'login_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class LoginNavigator with HomeRoute, SignUpRoute {
  LoginNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin LoginRoute {
  openLogin(LoginInitialParams initialParams) {
    navigator.pushAndRemoveUntil(
        context: context,
        routeName: LoginPage(
            cubit: getIt(param1: initialParams),
            dataSources: getIt(),
            splashCubit: getIt(param1: const SplashInitialParams())),
        transitionType: TransitionType.slideFromRight,
        predicate: (route) => false);
  }

  AppNavigator get navigator;

  BuildContext get context;
}
