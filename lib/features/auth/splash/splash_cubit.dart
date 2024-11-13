import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/response/api_response.dart';
import 'package:flutter_template/domain/usecases/auth/splash/splash_use_cases.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';
import '../onboarding/onboarding_initial_params.dart';
import 'splash_navigator.dart';

import '/domain/usecases/local/check_for_existing_user_use_case.dart';
import '/domain/usecases/theme/get_theme_use_case.dart';
import 'splash_initial_params.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashUseCases useCases;
  final SplashInitialParams initialParams;
  final SplashNavigator navigator;
  final CheckForExistingUserUseCase checkForExistingUserUseCase;
  final GetThemeUseCase getThemeUseCase;

  SplashCubit(this.initialParams, this.navigator,
      this.checkForExistingUserUseCase, this.getThemeUseCase, this.useCases)
      : super(SplashState.initial(initialParams: initialParams));

  checkUser() async {
    emit(state.copyWith(isloading: true));

    try {
      await Future.wait([
        checkForExistingUserUseCase.executeLogoBase64(),
        getThemeUseCase.execute(),
        checkForExistingUserUseCase.executeCheckSelectedLanguage().then(
            (value) => value.fold((error) {},
                (languageSettings) => systemSettings(languageSettings)))
      ]);

      final userCheckResult = await checkForExistingUserUseCase.execute();
      userCheckResult.fold((error) async {
        await Future.delayed(const Duration(seconds: 2));
        navigator.openOnboarding(const OnboardingInitialParams());
      }, (user) async {
        await Future.delayed(const Duration(seconds: 2));
        navigator.openHome(const HomeInitialParams());
      });
    } finally {
      emit(state.copyWith(isloading: false));
    }
  }

  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ar', 'name': 'Arabic'}
  ];

  Future<void> systemSettings(String lang) async {
    emit(state.copyWith(
        response: ApiResponse.loading(), isloadingLanguageChange: true));
    final splash = await useCases.execute(lang: lang);
    splash.fold(
        (l) => emit(state.copyWith(
            response: ApiResponse.error(l.error),
            isloadingLanguageChange: false)),
        ((r) => emit(state.copyWith(
            response: ApiResponse.completed(r),
            isloadingLanguageChange: false))));
  }
}
