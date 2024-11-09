import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/show/show/show.dart';
import 'package:flutter_template/domain/repositories/login/login_with_otp_base_api_service.dart';
import 'package:flutter_template/features/otp/otp_initial_params.dart';
import 'login_with_otp_initial_params.dart';
import 'login_with_otp_navigator.dart';
import 'login_with_otp_state.dart';

class LoginWithOtpCubit extends Cubit<LoginWithOtpState> {
  final LoginWithOtpBaseApiService baseApiServices;
  final LoginWithOtpNavigator navigator;
  final LoginWithOtpInitialParams initialParams;
  final Show show;
  LoginWithOtpCubit(
      this.initialParams, this.baseApiServices, this.navigator, this.show)
      : super(LoginWithOtpState.initial(initialParams: initialParams));

  Future<void> loginWithOtp({required Map<String, dynamic> body}) async {
    emit(state.copyWith(isLoading: true));
    final loginWithOtp = await baseApiServices.loginWithOtp(body: body);
    loginWithOtp.fold(
        (l) => emit(state.copyWith(isLoading: false, error: l.error)), ((r) {
      emit(state.copyWith(isLoading: false));
      show.showSuccessSnackBar(r['message']);
      Future.delayed(const Duration(seconds: 2),
          () => navigator.openOtp(OtpInitialParams(otp: r['otp'])));
    }));
  }
}
