import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext? context;

  Future<void> navigateTo(String routeName) async {
    await Future.delayed(Duration.zero);
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushNamed(routeName);
    }
  }

  Future<void> replaceTo(String routeName) async {
    await Future.delayed(Duration.zero);
    if (context != null && context!.mounted) {
      Navigator.of(context!).pushReplacementNamed(routeName);
    }
  }
} 