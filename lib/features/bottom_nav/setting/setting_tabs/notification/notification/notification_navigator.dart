import 'package:flutter/material.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/notification/notification_setting/notification_setting_navigator.dart';
import 'notification_initial_params.dart';
import 'notification_page.dart';
import '../../../../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class NotificationNavigator with NotificationSettingRoute {
  NotificationNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin NotificationRoute {
  openNotification(NotificationInitialParams initialParams) {
    navigator.push(
        context: context,
        routeName: NotificationPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
