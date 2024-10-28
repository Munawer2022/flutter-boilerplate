import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/profile/profile_success_model.dart';

import 'profile_initial_params.dart';

class ProfileState {
  final ProfileSuccessModel success;
  final bool isLoading;
  final String? error;

  ProfileState({required this.success, required this.isLoading, this.error});
  factory ProfileState.initial({required ProfileInitialParams initialParams}) =>
      ProfileState(success: ProfileSuccessModel.empty(), isLoading: false);
  ProfileState copyWith(
          {ProfileSuccessModel? success, bool? isLoading, String? error}) =>
      ProfileState(
          success: success ?? this.success,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
