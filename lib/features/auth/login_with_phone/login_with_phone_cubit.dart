import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/show/show/show.dart';
import 'package:flutter_template/domain/repositories/auth/login_with_phone/login_with_phone_base_api_service.dart';
import 'package:flutter_template/domain/usecases/auth/login_with_phone/login_with_phone_use_cases.dart';
import 'package:flutter_template/features/auth/otp/otp_initial_params.dart';
import 'login_with_phone_initial_params.dart';
import 'login_with_phone_navigator.dart';
import 'login_with_phone_state.dart';

class LoginWithPhoneCubit extends Cubit<LoginWithPhoneState> {
  final LoginWithOtpUseCases useCases;
  final LoginWithPhoneNavigator navigator;
  final LoginWithPhoneInitialParams initialParams;
  final Show show;
  LoginWithPhoneCubit(
      this.initialParams, this.useCases, this.navigator, this.show)
      : super(LoginWithPhoneState.initial(initialParams: initialParams));

  Future<void> loginWithPhone({required Map<String, dynamic> body}) async {
    emit(state.copyWith(isLoading: true));
    final loginWithOtp = await useCases.execute(body: body);
    loginWithOtp.fold(
        (l) => emit(state.copyWith(isLoading: false, error: l.error)), ((r) {
      emit(state.copyWith(isLoading: false));
      show.showSuccessSnackBar('OTP sent to your phone number.');
      Future.delayed(
          const Duration(seconds: 2),
          () =>
              navigator.openOtp(OtpInitialParams(otp: r.data.otp)));
    }));
  }
}
