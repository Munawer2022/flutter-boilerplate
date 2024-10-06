


import '/domain/entities/profile/mock_profile_success_model.dart';
import 'profile_initial_params.dart';

class ProfileState {
  final MockProfileSuccessModel success;
  final bool isLoading;
  final String? error;

  ProfileState({required this.success, required this.isLoading, this.error});
  factory ProfileState.initial({required ProfileInitialParams initialParams}) =>
      ProfileState(
          success: MockProfileSuccessModel.empty().copyWith(),
          isLoading: false);
  ProfileState copyWith(
          {MockProfileSuccessModel? success,
          bool? isLoading,
          String? error}) =>
      ProfileState(
          success: success ?? this.success,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}

 