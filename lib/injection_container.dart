/*
************************ Setting ************************
*/
import 'features/setting/setting_cubit.dart';
import 'features/setting/setting_navigator.dart';
import 'features/setting/setting_initial_params.dart';
import 'data/repositories/setting/setting_repository.dart';
import 'domain/repositories/setting/setting_base_api_service.dart';

/*
************************ Home ************************
*/
import 'package:flutter_template/data/repositories/splash/splash_repository.dart';
import 'package:flutter_template/domain/repositories/splash/splash_base_api_service.dart';

import 'features/home/home_cubit.dart';
import 'features/home/home_navigator.dart';
import 'features/home/home_initial_params.dart';
import 'data/repositories/home/home_repository.dart';
import 'domain/repositories/home/home_base_api_service.dart';

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
import 'features/splash/splash_cubit.dart';
import 'features/splash/splash_initial_params.dart';
import 'features/splash/splash_navigator.dart';
/*
 ************************ login ************************
*/
import 'data/datasources/auth/login_data_sources.dart';
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
import 'domain/repositories/onboarding/onboarding_base_api_service.dart';
import 'data/repositories/onboarding/onboarding_repository.dart';
import 'features/onboarding/onboarding_navigator.dart';
import 'features/onboarding/onboarding_cubit.dart';
import 'features/onboarding/onboarding_initial_params.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppNavigator>(AppNavigator());

  getIt.registerSingleton<LoginDataSources>(LoginDataSources());

  getIt.registerSingleton<NetworkBaseApiService>(
      HttpsNetworkRepository(getIt()));
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

/*
************************ Splash ************************
*/
  getIt.registerSingleton<SplashBaseApiService>(SplashRepository(getIt()));
  // getIt.registerSingleton<SplashBaseApiService>(MockSplashRepository());
  getIt.registerSingleton<SplashNavigator>(SplashNavigator(getIt()));
  getIt.registerFactoryParam<SplashCubit, SplashInitialParams, dynamic>(
      (params, _) => SplashCubit(params, getIt(), getIt(), getIt(), getIt()));
/*
************************ login ************************
*/
  getIt.registerSingleton<LoginBaseApiService>(LoginRepository(getIt()));
//   getIt.registerSingleton<LoginBaseApiService>(MockLoginRepository());
  getIt.registerSingleton<CheckForExistingUserUseCase>(
      CheckForExistingUserUseCase(getIt(), getIt()));
  getIt.registerSingleton<LoginUseCases>(
      LoginUseCases(getIt(), getIt(), getIt()));
  getIt.registerSingleton<LoginNavigator>(LoginNavigator(getIt()));
  getIt.registerFactoryParam<LoginCubit, LoginInitialParams, dynamic>(
      (params, _) => LoginCubit(params, getIt(), getIt()));

/*
************************ Onboarding ************************
*/
  getIt.registerSingleton<OnboardingBaseApiService>(
      OnboardingRepository(getIt()));
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
  getIt.registerSingleton<SettingBaseApiService>(SettingRepository(getIt()));
  // getIt.registerSingleton<SettingBaseApiService>(MockSettingRepository());
  getIt.registerSingleton<SettingNavigator>(SettingNavigator(getIt()));
  getIt.registerFactoryParam<SettingCubit, SettingInitialParams, dynamic>(
      (params, _) => SettingCubit(params, getIt()
      , getIt()
      
      )
      ..setting()
      );

}
