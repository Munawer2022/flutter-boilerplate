import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/response/api_response.dart';
import 'package:flutter_template/domain/repositories/splash/splash_base_api_service.dart';
import 'package:flutter_template/features/home/home_initial_params.dart';
import '/features/onboarding/onboarding_initial_params.dart';
import '/features/splash/splash_navigator.dart';

import '/domain/usecases/local/check_for_existing_user_use_case.dart';
import '/domain/usecases/theme/get_theme_use_case.dart';
import 'splash_initial_params.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashBaseApiService baseApiServices;
  final SplashInitialParams initialParams;
  final SplashNavigator navigator;
  final CheckForExistingUserUseCase checkForExistingUserUseCase;
  final GetThemeUseCase getThemeUseCase;

  SplashCubit(
      this.initialParams,
      this.navigator,
      this.checkForExistingUserUseCase,
      this.getThemeUseCase,
      this.baseApiServices)
      : super(SplashState.initial(initialParams: initialParams));

  checkUser() {
    getThemeUseCase.execute();

    emit(state.copyWith(isloading: true));
    checkForExistingUserUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isloading: false));
              // return navigator.openLogin(const LoginInitialParams());
              return navigator.openOnboarding(const OnboardingInitialParams());
            },
            (r) {
              emit(state.copyWith(isloading: false));
              return navigator.openHome(const HomeInitialParams());
            },
          ),
        );
  }

  Future<void> splash() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    final home = await baseApiServices.splash();
    home.fold((l) => emit(state.copyWith(response: ApiResponse.error(l.error))),
        ((r) => emit(state.copyWith(response: ApiResponse.completed(r)))));
  }
}
