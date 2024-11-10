import 'package:flutter/material.dart';
import 'notification_setting_initial_params.dart';
import 'notification_setting_page.dart';
import '../../../../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class NotificationSettingNavigator {
  NotificationSettingNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin NotificationSettingRoute {
openNotificationSetting(NotificationSettingInitialParams initialParams) {
navigator.push(
context: context,
        routeName: NotificationSettingPage(cubit: getIt(param1: initialParams))
);
}

AppNavigator get navigator;

BuildContext get context;
}
