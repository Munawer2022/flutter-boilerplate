import 'package:flutter/material.dart';
import 'notifications_setting_initial_params.dart';
import 'notifications_setting_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class NotificationsSettingNavigator {
  NotificationsSettingNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin NotificationsSettingRoute {
openNotificationsSetting(NotificationsSettingInitialParams initialParams) {
navigator.push(
context: context,
        routeName: NotificationsSettingPage(cubit: getIt(param1: initialParams))
);
}

AppNavigator get navigator;

BuildContext get context;
}
