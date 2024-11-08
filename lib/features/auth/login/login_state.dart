import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:flutter_template/data/models/user_model.dart';

import 'login_initial_params.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final UserModel? user;
  final bool isLoggedIn;

  LoginState({
    required this.isLoading,
    this.error,
    this.user,
    required this.isLoggedIn,
  });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        isLoggedIn: false,
      );

  LoginState copyWith({
    bool? isLoading,
    String? error,
    UserModel? user,
    bool? isLoggedIn,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
