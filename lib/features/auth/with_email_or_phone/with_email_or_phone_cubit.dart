import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/auth/login/login_initial_params.dart';
import 'package:flutter_template/features/auth/login_with_phone/login_with_phone_initial_params.dart';
import 'with_email_or_phone_initial_params.dart';
import 'with_email_or_phone_navigator.dart';
import 'with_email_or_phone_state.dart';

class WithEmailOrPhoneCubit extends Cubit<WithEmailOrPhoneState> {
  final WithEmailOrPhoneNavigator navigator;
  final WithEmailOrPhoneInitialParams initialParams;
  WithEmailOrPhoneCubit(this.initialParams, this.navigator)
      : super(WithEmailOrPhoneState.initial(initialParams: initialParams));

  goLoginWithEmail() => navigator.openLogin(const LoginInitialParams());

  goLoginWithPhone() =>
      navigator.openLoginWithPhone(const LoginWithPhoneInitialParams());
}
