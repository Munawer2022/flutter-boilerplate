import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'features/auth/onboarding/onboarding_page.dart';
import 'features/auth/onboarding/onboarding_initial_params.dart';
import '/config/theme/theme_data.dart';
import '/injection_container.dart' as di;
import '/injection_container.dart';
import '/data/datasources/theme/theme_data_source.dart';
import '/core/global.dart';
import '/core/show/checker_navigator_observer.dart';
import 'package:device_preview/device_preview.dart';

import 'features/auth/splash/splash_initial_params.dart';
import 'features/auth/splash/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
//  setCustomSystemUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(dataSources: getIt());
      }));
}

class MyApp extends StatelessWidget {
  final SplashDataSources dataSources;

  const MyApp({super.key, required this.dataSources});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => BlocBuilder(
            bloc: dataSources,
            builder: (context, state) {
              return BlocBuilder(
                  bloc: getIt<ThemeDataSources>(),
                  builder: (context, state) {
                    state as bool;
                    final appThemes = getIt<AppThemes>();

                    return MaterialApp(
                        locale: Locale(dataSources.currentLang),
                        supportedLocales: const [
                          Locale('en', ''), // English
                          Locale('ar', ''), // Arabic
                        ],
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations
                              .delegate, // Cupertino localizations
                        ],
                        localeResolutionCallback: (locale, supportedLocales) {
                          for (var supportedLocale in supportedLocales) {
                            if (supportedLocale.languageCode ==
                                locale?.languageCode) {
                              return supportedLocale;
                            }
                          }
                          return supportedLocales.first;
                        },
                        // useInheritedMediaQuery: true,
                        // locale: DevicePreview.locale(context),
                        builder: DevicePreview.appBuilder,
                        navigatorKey: GlobalConstants.navigatorKey,
                        scaffoldMessengerKey:
                            GlobalConstants.scaffoldMessengerKey,
                        navigatorObservers: [CheckerNavigatorObserver()],
                        debugShowCheckedModeBanner: false,
                        theme:
                            state ? appThemes.darkTheme : appThemes.lightTheme,
                            // state ? appThemes.lightTheme : appThemes.darkTheme,

                        // scaffoldMessengerKey: scaffoldMessengerKey,
                        // home: OnboardingPage(cubit: getIt(param1: const OnboardingInitialParams()))

                        home: SplashPage(
                            cubit: getIt(param1: const SplashInitialParams()),
                            dataSources: getIt()));
                  });
            }));
  }
}
