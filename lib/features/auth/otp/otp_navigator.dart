import 'package:flutter/material.dart';
import 'package:flutter_template/features/bottom_nav/home/home_navigator.dart';
import 'otp_initial_params.dart';
import 'otp_page.dart';
import '../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class OtpNavigator with HomeRoute {
  OtpNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin OtpRoute {
  openOtp(OtpInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: OtpPage(
            cubit: getIt(param1: initialParams),
            initialParams: initialParams,
            dataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
