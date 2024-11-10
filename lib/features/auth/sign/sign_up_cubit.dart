import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/repositories/auth/sign/sign_up_base_api_service.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';
import 'sign_up_initial_params.dart';
import 'sign_up_navigator.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpBaseApiService baseApiServices;
  final SignUpNavigator navigator;
  final SignUpInitialParams initialParams;
  SignUpCubit(this.initialParams, this.baseApiServices, this.navigator)
      : super(SignUpState.initial(initialParams: initialParams));

  Future<void> signUp({required Map<String, dynamic> body}) async {
    emit(state.copyWith(isLoading: true));
    final signUp = await baseApiServices.sign_up(body: body);
    signUp.fold((l) => emit(state.copyWith(isLoading: false, error: l.error)),
        ((r) {
      emit(state.copyWith(success: r, isLoading: false));
      return navigator.openHome(const HomeInitialParams());
    }));
  }
}
