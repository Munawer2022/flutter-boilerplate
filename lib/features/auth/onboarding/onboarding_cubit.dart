import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/auth/with_email_or_phone/with_email_or_phone_initial_params.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_navigator.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingNavigator navigator;
  final OnboardingInitialParams initialParams;
  OnboardingCubit(this.initialParams, this.navigator)
      : super(OnboardingState.initial(initialParams: initialParams));

  goHomePage() =>
      navigator.openWithEmailOrPhone(const WithEmailOrPhoneInitialParams());
}
