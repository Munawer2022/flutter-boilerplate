import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';

import 'login_with_phone_initial_params.dart';

class LoginWithPhoneState {
  final LocalUserInfoStoreModel success;
  final bool isLoading;
  final String? error;

  LoginWithPhoneState(
      {required this.success, required this.isLoading, this.error});
  factory LoginWithPhoneState.initial(
          {required LoginWithPhoneInitialParams initialParams}) =>
      LoginWithPhoneState(
          success: LocalUserInfoStoreModel.empty().copyWith(),
          isLoading: false);
  LoginWithPhoneState copyWith(
          {LocalUserInfoStoreModel? success, bool? isLoading, String? error}) =>
      LoginWithPhoneState(
          success: success ?? this.success,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
