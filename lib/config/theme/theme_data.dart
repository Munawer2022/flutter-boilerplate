import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 30)),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue));

ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith());
TextTheme textTheme = const TextTheme();
