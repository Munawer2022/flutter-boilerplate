import 'package:flutter/material.dart';
import 'package:flutter_template/features/faq/faq_navigator.dart';
import 'package:flutter_template/features/notification/notification_navigator.dart';
import 'package:flutter_template/features/profile/profile_navigator.dart';
import 'package:flutter_template/features/splash/splash_initial_params.dart';
import 'setting_initial_params.dart';
import 'setting_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class SettingNavigator with ProfileRoute, NotificationRoute, FaqRoute {
  SettingNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin SettingRoute {
  openSetting(SettingInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: SettingPage(
            cubit: getIt(param1: initialParams),
            dataSources: getIt(),
            splashCubit: getIt(param1: const SplashInitialParams())));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
