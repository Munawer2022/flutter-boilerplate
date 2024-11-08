import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_navigator.dart';
import 'onboarding_state.dart';
import 'package:flutter_template/features/auth/login/login_initial_params.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingNavigator navigator;
  final OnboardingInitialParams initialParams;
  OnboardingCubit(this.initialParams, this.navigator)
      : super(OnboardingState.initial(initialParams: initialParams));

  goHomePage() => navigator.openHome(const HomeInitialParams());
  goToLogin() => navigator.openLogin(const LoginInitialParams());


}
