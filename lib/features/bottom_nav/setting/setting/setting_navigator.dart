import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/login/login_navigator.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/faq/faq_navigator.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/notification/notification/notification_navigator.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_navigator.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/profile/profile_navigator.dart';
import 'package:flutter_template/features/auth/splash/splash_initial_params.dart';
import 'setting_initial_params.dart';
import 'setting_page.dart';
import '../../../../config/navigation/app_navigator.dart';
import '/injection_container.dart';

class SettingNavigator
    with
        ProfileRoute,
        NotificationRoute,
        FaqRoute,
        PagesWebViewRoute,
        LoginRoute {
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
            splashCubit: getIt(param1: const SplashInitialParams()),
            loginDataSources: getIt()));
  }

  AppNavigator get navigator;

  BuildContext get context;
}
