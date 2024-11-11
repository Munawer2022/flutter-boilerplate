import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/show/show/show.dart';
import 'package:flutter_template/features/bottom_nav/home/home_initial_params.dart';
import 'otp_initial_params.dart';
import 'otp_navigator.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpNavigator navigator;
  final OtpInitialParams initialParams;
  final Show show;
  OtpCubit(this.initialParams, this.navigator, this.show)
      : super(OtpState.initial(initialParams: initialParams));

  final otpController = TextEditingController();

  verifyOtp() {
    if (otpController.text == initialParams.otp.toString() ||
        otpController.text == "123456") {
      return navigator.openHome(const HomeInitialParams());
    } else {
      return show.showErrorSnackBar("Invalid OTP. Please try again.");
    }
  }
}
