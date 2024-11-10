import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/features/auth/otp/otp_initial_params.dart';
import 'otp_cubit.dart';
import 'otp_state.dart';
import 'otp_state.dart';
import '../../../config/status_switcher.dart';

class OtpPage extends StatefulWidget {
  final OtpCubit cubit;
  final OtpInitialParams initialParams;
  final SplashDataSources dataSources;

  const OtpPage({
    super.key,
    required this.cubit,
    required this.initialParams,
    required this.dataSources,
  });

  @override
  State<OtpPage> createState() => _OtpState();
}

class _OtpState extends State<OtpPage> {
  OtpCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  void dispose() {
    cubit.otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataSources.state;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  40.verticalSpace,
                  Center(
                    child: Image.network(
                      data['data']['app_logo'],
                      height: 80,
                    ),
                  ),
                  60.verticalSpace,
                  // Phone Number Field

                  // Password Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          10.horizontalSpace,
                          Expanded(
                              child: AppTextFormField.textFormField(
                            controller: cubit.otpController,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            context: context,
                            titleText: "Enter OTP",
                            hintText: "Enter OTP",
                          ))
                        ],
                      ),
                    ],
                  ),

                  50.verticalSpace,
                  AppButton.getButton(
                      child: const Text("Home"),
                      onPressed: () => cubit.verifyOtp())
                ],
              )),
        ),
      ),
    );
  }
}
