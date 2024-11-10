import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';

import 'sign_up_initial_params.dart';

class SignUpState {
  final LocalUserInfoStoreModel success;
  final bool isLoading;
  final String? error;

  SignUpState({required this.success, required this.isLoading, this.error});
  factory SignUpState.initial({required SignUpInitialParams initialParams}) =>
      SignUpState(success: LocalUserInfoStoreModel.empty(), isLoading: false);
  SignUpState copyWith(
          {LocalUserInfoStoreModel? success, bool? isLoading, String? error}) =>
      SignUpState(
          success: success ?? this.success,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
