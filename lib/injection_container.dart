/*
************************ PagesWebView ************************
*/
import 'features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_cubit.dart';
import 'features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_navigator.dart';
import 'features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_initial_params.dart';

/*
************************ Faq ************************
*/
import 'package:flutter_template/data/datasources/auth/splash/pages_data_sources.dart';

import 'features/bottom_nav/setting/setting_tabs/faq/faq_cubit.dart';
import 'features/bottom_nav/setting/setting_tabs/faq/faq_navigator.dart';
import 'features/bottom_nav/setting/setting_tabs/faq/faq_initial_params.dart';
import 'data/repositories/bottom_nav/setting/setting_tabs/faq/faq_repository.dart';
import 'domain/repositories/bottom_nav/setting/setting_tabs/faq/faq_base_api_service.dart';

/*
************************ Fqs ************************
*/

/*
************************ NotificationSetting ************************
*/
import 'package:flutter_template/data/datasources/auth/splash/language_translations_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/domain/usecases/auth/splash/splash_use_cases.dart';

import 'features/bottom_nav/setting/setting_tabs/notification/notification_setting/notification_setting_cubit.dart';
import 'features/bottom_nav/setting/setting_tabs/notification/notification_setting/notification_setting_navigator.dart';
import 'features/bottom_nav/setting/setting_tabs/notification/notification_setting/notification_setting_initial_params.dart';

/*
************************ Notification ************************
*/
import 'features/bottom_nav/setting/setting_tabs/notification/notification/notification_cubit.dart';
import 'features/bottom_nav/setting/setting_tabs/notification/notification/notification_navigator.dart';
import 'features/bottom_nav/setting/setting_tabs/notification/notification/notification_initial_params.dart';
import 'data/repositories/bottom_nav/setting/setting_tabs/notification/notification_repository.dart';
import 'domain/repositories/bottom_nav/setting/setting_tabs/notification/notification_base_api_service.dart';

/*
************************ Profile ************************
*/
import 'features/bottom_nav/setting/setting_tabs/profile/profile_cubit.dart';
import 'features/bottom_nav/setting/setting_tabs/profile/profile_navigator.dart';
import 'features/bottom_nav/setting/setting_tabs/profile/profile_initial_params.dart';
import 'data/repositories/bottom_nav/setting/setting_tabs/profile/profile_repository.dart';
import 'domain/repositories/bottom_nav/setting/setting_tabs/profile/profile_base_api_service.dart';

/*
************************ Setting ************************
*/
import 'features/bottom_nav/setting/setting/setting_cubit.dart';
import 'features/bottom_nav/setting/setting/setting_navigator.dart';
import 'features/bottom_nav/setting/setting/setting_initial_params.dart';

/*
************************ Home ************************
*/
import 'package:flutter_template/data/repositories/auth/splash/splash_repository.dart';
import 'package:flutter_template/domain/repositories/auth/splash/splash_base_api_service.dart';

import 'features/bottom_nav/home/home_cubit.dart';
import 'features/bottom_nav/home/home_navigator.dart';
import 'features/bottom_nav/home/home_initial_params.dart';
import 'data/repositories/bottom_nav/home/home_repository.dart';
import 'domain/repositories/bottom_nav/home/home_base_api_service.dart';

import 'package:get_it/get_it.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import 'data/repositories/network/https_network_repository.dart';
import 'config/navigation/app_navigator.dart';
import 'domain/repositories/local/local_storage_base_api_service.dart';
import 'data/repositories/local/insecure_local_storage_repository.dart';
import 'data/datasources/theme/theme_data_source.dart';
import 'domain/usecases/theme/get_theme_use_case.dart';
import 'domain/usecases/theme/update_theme_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'core/show/show/show.dart';
import '/data/datasources/internet_connectivity/internet_connectivity_checker_data_sources.dart';

/*
 ************************ Splash ************************
*/
import 'features/auth/splash/splash_cubit.dart';
import 'features/auth/splash/splash_initial_params.dart';
import 'features/auth/splash/splash_navigator.dart';
/*
 ************************ login ************************
*/
import 'data/datasources/auth/login/login_data_sources.dart';
import 'domain/usecases/auth/login/login_use_cases.dart';
import 'domain/repositories/auth/login/login_base_api_service.dart';
import 'data/repositories/auth/login/login_repository.dart';
import 'features/auth/login/login_navigator.dart';
import 'features/auth/login/login_cubit.dart';
import 'features/auth/login/login_initial_params.dart';
import '/domain/usecases/local/check_for_existing_user_use_case.dart';

/*
************************ Onboarding ************************
*/

import 'features/auth/onboarding/onboarding_navigator.dart';
import 'features/auth/onboarding/onboarding_cubit.dart';
import 'features/auth/onboarding/onboarding_initial_params.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppNavigator>(AppNavigator());

  getIt.registerSingleton<LoginDataSources>(LoginDataSources());
  getIt.registerSingleton<PagesDataSources>(PagesDataSources());
  getIt.registerSingleton<SplashDataSources>(SplashDataSources());
  getIt.registerSingleton<LanguageTranslationsDataSources>(
      LanguageTranslationsDataSources());

/*
************************ Theme ************************
*/
  getIt.registerSingleton<LocalStorageRepository>(
      InsecureLocalStorageRepository());
  getIt.registerSingleton<ThemeDataSources>(ThemeDataSources());
  getIt.registerSingleton<GetThemeUseCase>(GetThemeUseCase(getIt(), getIt()));
  getIt.registerSingleton<UpdateThemeUseCase>(
      UpdateThemeUseCase(getIt(), getIt()));
  getIt.registerSingleton<Connectivity>(Connectivity());
  getIt.registerSingleton<Show>(Show());

  getIt.registerSingleton<InternetConnectivityCheckerDataSources>(
      InternetConnectivityCheckerDataSources(getIt(), getIt()));

  getIt.registerSingleton<NetworkBaseApiService>(
      HttpsNetworkRepository(getIt(), getIt()));
/*
************************ Splash ************************
*/
  getIt.registerSingleton<SplashBaseApiService>(SplashRepository(getIt()));
  // getIt.registerSingleton<SplashBaseApiService>(MockSplashRepository());
  getIt.registerSingleton<SplashUseCases>(
      SplashUseCases(getIt(), getIt(), getIt(), getIt(), getIt()));
  getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
  getIt.registerFactoryParam<SplashCubit, SplashInitialParams, dynamic>(
      (params, _) => SplashCubit(params, getIt(), getIt(), getIt(), getIt()));
/*
************************ login ************************
*/
  getIt.registerSingleton<LoginBaseApiService>(LoginRepository(getIt()));
//   getIt.registerSingleton<LoginBaseApiService>(MockLoginRepository());
  getIt.registerSingleton<CheckForExistingUserUseCase>(
      CheckForExistingUserUseCase(getIt(), getIt(), getIt()));
  getIt.registerSingleton<LoginUseCases>(
      LoginUseCases(getIt(), getIt(), getIt()));
  getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
  getIt.registerFactoryParam<LoginCubit, LoginInitialParams, dynamic>(
      (params, _) => LoginCubit(params, getIt(), getIt()));

/*
************************ Onboarding ************************
*/

  // getIt.registerSingleton<OnboardingBaseApiService>(MockOnboardingRepository());
  getIt.registerSingleton<OnboardingNavigator>(OnboardingNavigator(getIt()));
  getIt.registerFactoryParam<OnboardingCubit, OnboardingInitialParams, dynamic>(
      (params, _) => OnboardingCubit(params, getIt()));
/*
************************ Home ************************
*/
  getIt.registerSingleton<HomeBaseApiService>(HomeRepository(getIt()));
  // getIt.registerSingleton<HomeBaseApiService>(MockHomeRepository());
  getIt.registerSingleton<HomeNavigator>(HomeNavigator(getIt()));
  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (params, _) => HomeCubit(params, getIt(), getIt()));
/*
************************ Setting ************************
*/
  getIt.registerSingleton<SettingNavigator>(SettingNavigator(getIt()));
  getIt.registerFactoryParam<SettingCubit, SettingInitialParams, dynamic>(
      (params, _) => SettingCubit(params, getIt(), getIt(), getIt())
      // ..setting()
      );

/*
************************ Profile ************************
*/
  getIt.registerSingleton<ProfileBaseApiService>(ProfileRepository(getIt()));
  // getIt.registerSingleton<ProfileBaseApiService>(MockProfileRepository());
  getIt.registerSingleton<ProfileNavigator>(ProfileNavigator(getIt()));
  getIt.registerFactoryParam<ProfileCubit, ProfileInitialParams, dynamic>(
      (params, _) => ProfileCubit(params, getIt(), getIt()));

/*
************************ Notification ************************
*/
  getIt.registerSingleton<NotificationBaseApiService>(
      NotificationRepository(getIt()));
  // getIt.registerSingleton<NotificationBaseApiService>(MockNotificationRepository());
  getIt
      .registerSingleton<NotificationNavigator>(NotificationNavigator(getIt()));
  getIt.registerFactoryParam<NotificationCubit, NotificationInitialParams,
      dynamic>((params, _) => NotificationCubit(params, getIt(), getIt())
    ..notification());
/*
************************ NotificationSetting ************************
*/
  getIt.registerSingleton<NotificationSettingNavigator>(
      NotificationSettingNavigator(getIt()));
  getIt.registerFactoryParam<
      NotificationSettingCubit,
      NotificationSettingInitialParams,
      dynamic>((params, _) => NotificationSettingCubit(params, getIt()));

/*
************************ Faq ************************
*/
  getIt.registerSingleton<FaqBaseApiService>(FaqRepository(getIt()));
  // getIt.registerSingleton<FaqBaseApiService>(MockFaqRepository());
  getIt.registerSingleton<FaqNavigator>(FaqNavigator(getIt()));
  getIt.registerFactoryParam<FaqCubit, FaqInitialParams, dynamic>(
      (params, _) => FaqCubit(params, getIt(), getIt())..faq());
/*
************************ PagesWebView ************************
*/

  // getIt.registerSingleton<PagesWebViewBaseApiService>(MockPagesWebViewRepository());
  getIt
      .registerSingleton<PagesWebViewNavigator>(PagesWebViewNavigator(getIt()));
  getIt.registerFactoryParam<PagesWebViewCubit, PagesWebViewInitialParams,
      dynamic>((params, _) => PagesWebViewCubit(params, getIt()));
}
