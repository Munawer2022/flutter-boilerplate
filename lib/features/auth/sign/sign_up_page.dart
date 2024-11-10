import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/data/models/auth/sign/sign_up_model.dart';
import 'sign_up_cubit.dart';
import 'sign_up_state.dart';
import 'sign_up_state.dart';
import '/core/status_switcher.dart';

class SignUpPage extends StatefulWidget {
  final SignUpCubit cubit;
  final SplashDataSources dataSources;
  const SignUpPage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  SignUpCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _countryCode = "+968"; // Default to Oman

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      AppTextFormField.textFormField(
                        controller: _phoneController,
                        context: context,
                        titleText: "Enter your name",
                        hintText: "Enter your name",
                      ),
                    ],
                  ),
                  20.verticalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      AppTextFormField.textFormField(
                        controller: _phoneController,
                        context: context,
                        titleText: "Enter your email",
                        hintText: "Enter your email",
                      ),
                    ],
                  ),
                  20.verticalSpace,

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
                  20.verticalSpace,
                  // Password Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.textFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        context: context,
                        titleText: "Enter your password",
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  8.verticalSpace,
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        state as SignUpState;
                        return AppButton.getButton(
                            loading: state.isLoading,
                            child: const Text('Sign Up'),
                            onPressed: () => cubit.signUp(
                                body: SignUpModel(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        phone: _phoneController.text,
                                        password: _passwordController.text)
                                    .toJson()));
                      }),
                  24.verticalSpace,
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
