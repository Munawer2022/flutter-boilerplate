import 'package:flutter/material.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import 'sign_up_initial_params.dart';
import 'sign_up_page.dart';
import '../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class SignUpNavigator with HomeRoute {
  SignUpNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin SignUpRoute {
  openSignUp(SignUpInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: SignUpPage(cubit: getIt(param1: initialParams), dataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
