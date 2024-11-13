import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/config/services.dart';
import 'package:flutter_template/data/datasources/user/user_data_sources.dart';
import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/data/models/auth/login_with_phone/login_with_phone_model.dart';
import 'login_with_phone_cubit.dart';
import 'login_with_phone_state.dart';
import 'login_with_phone_state.dart';
import '../../../config/status_switcher.dart';

class LoginWithPhonePage extends StatefulWidget {
  final LoginWithPhoneCubit cubit;
  final AppDataSources dataSources;

  const LoginWithPhonePage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<LoginWithPhonePage> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithPhonePage> {
  LoginWithPhoneCubit get cubit => widget.cubit;

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
                          countryCodePicker(
                            context: context,
                            onChanged: (countryCode) {
                              setState(() {
                                _countryCode = countryCode.dialCode ?? "+968";
                              });
                            },
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
                        state as LoginWithPhoneState;
                        return AppButton.getButton(
                            loading: state.isLoading,
                            child: const Text('Login'),
                            onPressed: () => cubit.loginWithPhone(
                                body: LoginWithPhoneModel(
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
