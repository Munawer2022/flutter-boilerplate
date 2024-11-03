import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    cardColor: Colors.white,
    dividerTheme: DividerThemeData(color: Colors.grey.shade100),
    // appBarTheme: const AppBarTheme(
    //     titleTextStyle: TextStyle(
    //         color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 30)),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));

ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    // brightness: Brightness.dark,
    textTheme: textTheme,
    cardColor: Colors.black,

    // appBarTheme: const AppBarTheme(
    //     titleTextStyle: TextStyle(
    //         color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 30)),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, brightness: Brightness.dark));
TextTheme textTheme = const TextTheme();
