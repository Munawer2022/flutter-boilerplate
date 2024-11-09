import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';

import 'login_with_otp_initial_params.dart';

class LoginWithOtpState {
  final LocalUserInfoStoreModel success;
  final bool isLoading;
  final String? error;

  LoginWithOtpState(
      {required this.success, required this.isLoading, this.error});
  factory LoginWithOtpState.initial(
          {required LoginWithOtpInitialParams initialParams}) =>
      LoginWithOtpState(
          success: LocalUserInfoStoreModel.empty().copyWith(),
          isLoading: false);
  LoginWithOtpState copyWith(
          {LocalUserInfoStoreModel? success, bool? isLoading, String? error}) =>
      LoginWithOtpState(
          success: success ?? this.success,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
