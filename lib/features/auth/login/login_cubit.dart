import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';
import 'package:flutter_template/features/auth/sign/sign_up_initial_params.dart';
import 'login_initial_params.dart';
import 'login_navigator.dart';
import 'login_state.dart';
import '/domain/usecases/auth/login/login_use_cases.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginInitialParams initialParams;
  final LoginUseCases useCases;
  final LoginNavigator navigator;

  LoginCubit(this.initialParams, this.useCases, this.navigator)
      : super(LoginState.initial(initialParams: initialParams));

  void login({required Map<String, dynamic> body}) {
    emit(state.copyWith(isLoading: true));
    useCases.execute(body: body).then((value) => value
            .fold((l) => emit(state.copyWith(error: l.error, isLoading: false)),
                ((r) {
          emit(state.copyWith(success: r, isLoading: false));
          return navigator.openHome(const HomeInitialParams());
        })));
  }

  void goSignUpPage() => navigator.openSignUp(const SignUpInitialParams());
}
