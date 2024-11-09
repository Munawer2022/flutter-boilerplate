import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/data/datasources/auth/login/login_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/data/models/login_with_otp/login_with_otp_model.dart';
import 'login_with_otp_cubit.dart';
import 'login_with_otp_state.dart';
import 'login_with_otp_state.dart';
import '/core/status_switcher.dart';

class LoginWithOtpPage extends StatefulWidget {
  final LoginWithOtpCubit cubit;
  final SplashDataSources dataSources;

  const LoginWithOtpPage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<LoginWithOtpPage> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtpPage> {
  LoginWithOtpCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  final _phoneController = TextEditingController(text: "923433330488");
  String _countryCode = "+968"; // Default to Oman

  @override
  void dispose() {
    _phoneController.dispose();
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
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0.r),
                                border: Border.all(
                                  strokeAlign: 1,
                                  color: const Color(0xffEFE9E9),
                                )),
                            child: CountryCodePicker(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0.r)),
                                textStyle:
                                    Theme.of(context).textTheme.titleLarge,
                                onChanged: (countryCode) {
                                  setState(() {
                                    _countryCode =
                                        countryCode.dialCode ?? "+968";
                                  });
                                },
                                initialSelection: 'OM',
                                favorite: const ['OM'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false),
                          ),
                          10.horizontalSpace,
                          // Expanded(
                          //   child: TextField(
                          //     controller: _phoneController,
                          //     decoration: InputDecoration(
                          //       hintText: 'Enter your phone number',
                          //       hintStyle: TextStyle(color: Colors.grey[400]),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //       enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //         borderSide:
                          //             BorderSide(color: Colors.grey[300]!),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                              child: AppTextFormField.textFormField(
                            controller: _phoneController,
                            context: context,
                            titleText: "Enter your phone number",
                            hintText: "Enter your phone number",
                          ))
                        ],
                      ),
                    ],
                  ),

                  50.verticalSpace,
                  BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        state as LoginWithOtpState;
                        return AppButton.getButton(
                            loading: state.isLoading,
                            child: const Text('Login'),
                            onPressed: () => cubit.loginWithOtp(
                                body: LoginWithOtpModel(
                                        phone: _phoneController.text)
                                    .toJson()));
                      }),
                ],
              )),
        ),
      ),
    );
  }
}