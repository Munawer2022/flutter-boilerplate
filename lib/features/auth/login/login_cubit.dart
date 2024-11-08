import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/repositories/login_repository.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'login_initial_params.dart';
import 'login_navigator.dart';
import 'login_state.dart';
import '/domain/usecases/auth/login/login_use_cases.dart';
import '/data/models/user_model.dart';
import '/domain/repositories/auth/login/login_base_api_service.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginBaseApiService repository;
  final SharedPreferences prefs;
  final LoginNavigator navigator;

  LoginCubit({required this.repository, required this.prefs, required this.navigator})
      : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(isLoading: true, error: null,isLoggedIn: false));
      print(email);
      print(password);
      final response = await repository.login(email, password);
      final user = UserModel.fromJson(response['data']);
      
      // Save to SharedPreferences
      await prefs.setString('user', jsonEncode(user.toJson()));
      await prefs.setBool('isLoggedIn', true);
      
      emit(state.copyWith(
        isLoading: false,
        user: user,
        isLoggedIn: true,
      ));

      // Navigate to home
      navigator.openHome(const HomeInitialParams());
      
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      final userStr = prefs.getString('user');
      if (userStr != null) {
        final user = UserModel.fromJson(jsonDecode(userStr));
        emit(state.copyWith(
          isLoggedIn: true,
          user: user,
        ));
         navigator.openHome(const HomeInitialParams());
      }
    }
  }
}
