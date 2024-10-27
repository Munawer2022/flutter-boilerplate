import 'package:flutter/material.dart';
import 'profile_initial_params.dart';
import 'profile_page.dart';
import '/config/navigation/app_navigator.dart';
import '/injection_container.dart';

class ProfileNavigator {
  ProfileNavigator(this.navigator);
  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin ProfileRoute {
openProfile(ProfileInitialParams initialParams) {
navigator.push(
context: context,
        routeName: ProfilePage(cubit: getIt(param1: initialParams))
);
}

AppNavigator get navigator;

BuildContext get context;
}
