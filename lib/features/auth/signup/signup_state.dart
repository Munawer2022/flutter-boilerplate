import 'package:flutter_template/features/auth/signup/signup_initial_params.dart';

class SignupState {
  final bool isLoading;
  final String? error;
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isValidName;
  final String? success;

  SignupState({
    this.isLoading = false,
    this.error,
    this.isValidEmail = true,
    this.isValidPassword = true,
    this.isValidName = true,
    this.success,
  });

  factory SignupState.initial({required SignupInitialParams initialParams}) =>
      SignupState();

  SignupState copyWith({
    bool? isLoading,
    String? error,
    bool? isValidEmail,
    bool? isValidPassword,
    bool? isValidName,
    String? success,
  }) =>
      SignupState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isValidName: isValidName ?? this.isValidName,
        success: success ?? this.success,
      );
} 