import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';

class AppThemes {
  final SplashDataSources dataSources;

  AppThemes(this.dataSources);

  // Helper method to parse color strings safely
  Color _getColor(String key, {String fallbackColor = '#000000'}) {
    final data = dataSources.state;
    String hexColor =
        data['data']?[key] != null ? data['data']![key] : fallbackColor;
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Color(int.parse(fallbackColor.replaceFirst('#', '0xFF')));
    }
  }

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
        secondaryHeaderColor:
            _getColor('app_secondary_color', fallbackColor: '#F53D3D'),
        disabledColor:
            _getColor('app_button_disable_color', fallbackColor: '#D81818'),
        scaffoldBackgroundColor:
            _getColor('app_splash_screen_bg_color', fallbackColor: '#FAFAFA'),
        cardColor: Colors.white,
        iconTheme: IconThemeData(
            color: _getColor('app_icon_color', fallbackColor: '#FF4747')),
        appBarTheme: AppBarTheme(
          backgroundColor:Colors.white,
              // _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
          titleTextStyle: TextStyle(
            color: _getColor('app_heading_color', fallbackColor: '#000000'),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: _getColor('app_button_active_color',
                    fallbackColor: '#F5870A'),
                disabledBackgroundColor: _getColor('app_button_disable_color',
                    fallbackColor: '#D81818'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0.r)),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                // backgroundColor: color ?? Colors.blue,
                minimumSize: Size(double.infinity.w, 50.0.h))),
        buttonTheme: ButtonThemeData(
          buttonColor:
              _getColor('app_button_active_color', fallbackColor: '#F5870A'),
          disabledColor:
              _getColor('app_button_disable_color', fallbackColor: '#D81818'),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: _getColor('app_heading_color', fallbackColor: '#000000'),
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: _getColor('app_subheading_color', fallbackColor: '#480505'),
            fontSize: 18.sp,
          ),
          labelLarge: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        dividerTheme: DividerThemeData(color: Colors.grey.shade100),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
          brightness: Brightness.light,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
        secondaryHeaderColor:
            _getColor('app_secondary_color', fallbackColor: '#F53D3D'),
        disabledColor:
            _getColor('app_button_disable_color', fallbackColor: '#D81818'),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.black,
        iconTheme: IconThemeData(
            color: _getColor('app_icon_color', fallbackColor: '#FF4747')),
        appBarTheme: AppBarTheme(
          backgroundColor:
              _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor:
              _getColor('app_button_active_color', fallbackColor: '#F5870A'),
          disabledColor:
              _getColor('app_button_disable_color', fallbackColor: '#D81818'),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: _getColor('app_subheading_color', fallbackColor: '#480505'),
            fontSize: 18.sp,
          ),
          labelLarge: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        dividerTheme: DividerThemeData(color: Colors.grey.shade800),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _getColor('app_primary_color', fallbackColor: '#2F8C1D'),
          brightness: Brightness.dark,
        ),
      );
}
