import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/usecases/auth/signup/signup_use_cases.dart';
import '../login/login_initial_params.dart';
import 'signup_initial_params.dart';
import 'signup_navigator.dart';
import 'signup_state.dart';
import 'signup_model.dart';
import 'package:flutter/material.dart';


class SignupCubit extends Cubit<SignupState> {
  final SignupInitialParams initialParams;
  final SignupNavigator navigator;
  final SignupUseCases useCases;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupCubit(this.initialParams, this.navigator, this.useCases)
      : super(SignupState.initial(initialParams: initialParams));

  void validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isValid = email.isNotEmpty && emailRegex.hasMatch(email);
    emit(state.copyWith(isValidEmail: isValid));
  }

  void validatePassword(String password) {
    final isValid = password.isNotEmpty && password.length >= 6;
    emit(state.copyWith(isValidPassword: isValid));
  }

  void validateName(String name) {
    final isValid = name.isNotEmpty && name.length >= 3;
    emit(state.copyWith(isValidName: isValid));
  }

  void goToLogin() => navigator.openLogin(const LoginInitialParams());

  void postSignup() {
    if (!state.isValidEmail || !state.isValidPassword || !state.isValidName) {
      emit(state.copyWith(
        error: 'Please enter valid information',
        isLoading: false,
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));
    
    useCases.execute(body: SignupModel(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
    ).toJson()).then(
      (value) => value.fold(
        (l) => emit(state.copyWith(error: l.error, isLoading: false)),
        (r) {
          emit(state.copyWith(success: "Signup successful", isLoading: false));
          navigator.openLogin(LoginInitialParams());
        },
      ),
    );
  }

  @override
  Future<void> close() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    return super.close();
  }
} 