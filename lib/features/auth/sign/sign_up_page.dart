import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/config/services.dart';
import 'package:flutter_template/config/translation_helper.dart'; 
import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/data/models/auth/sign/sign_up_model.dart';
import 'sign_up_cubit.dart';
import 'sign_up_state.dart';
import 'sign_up_state.dart';
import '../../../config/status_switcher.dart';

class SignUpPage extends StatefulWidget {
  final SignUpCubit cubit;
  final AppDataSources dataSources;
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
                      Text(
                        TranslationHelper.tr(widget.dataSources.state, 'name'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      AppTextFormField.textFormField(
                        controller: _nameController,
                        context: context,
                        titleText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_name'),
                        hintText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_name'),
                      ),
                    ],
                  ),
                  20.verticalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationHelper.tr(widget.dataSources.state, 'email'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      AppTextFormField.textFormField(
                        controller: _emailController,
                        context: context,
                        titleText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_email'),
                        hintText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_email'),
                      ),
                    ],
                  ),
                  20.verticalSpace,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationHelper.tr(widget.dataSources.state, 'phone_number'),
                        style: const TextStyle(
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
                              }),
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
                            titleText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_phone_number'),
                            hintText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_phone_number'),
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
                       Text(
                        TranslationHelper.tr(widget.dataSources.state, 'password'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.textFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        context: context,
                        titleText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_password'),
                        hintText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_password'),
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
                            child: Text(TranslationHelper.tr(widget.dataSources.state, 'sign_up')),
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
                      Text(TranslationHelper.tr(widget.dataSources.state, 'have_an_account')),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          TranslationHelper.tr(widget.dataSources.state, 'login'),
                          style:  TextStyle(
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
