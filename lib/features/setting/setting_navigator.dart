import 'package:flutter/material.dart';
import 'package:flutter_template/features/notification/notification_navigator.dart';
import 'package:flutter_template/features/profile/profile_navigator.dart';
import 'setting_initial_params.dart';
import 'setting_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class SettingNavigator with ProfileRoute, NotificationRoute {
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
        routeName: SettingPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
