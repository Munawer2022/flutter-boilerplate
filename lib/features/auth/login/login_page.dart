import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_bar.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/data/datasources/user/user_data_sources.dart';
import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
// import 'package:flutter_template/core/translation_helper.dart';
import 'package:flutter_template/config/translation_helper.dart';
// import 'package:flutter_template/data/datasources/auth/login/login_data_sources.dart';
// import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/features/auth/splash/splash_cubit.dart';
import 'login_cubit.dart';
import 'login_state.dart';
import '/data/models/auth/login/login_model.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit cubit;
  final AppDataSources dataSources;
  final SplashCubit splashCubit;

  const LoginPage(
      {super.key,
      required this.cubit,
      required this.dataSources,
      required this.splashCubit});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  LoginCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  final _phoneController = TextEditingController(text: 'ajmal@gmail.com');
  final _passwordController = TextEditingController(text: 'password');
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataSources.state;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
              // width: 120,
              child: DropdownButton<String>(
            value: widget.dataSources.currentLang,
            // value: selectedValue,
            // hint: const Text('English'),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            underline: const SizedBox(),
            items: widget.splashCubit.languages
                .map<DropdownMenuItem<String>>((lang) {
              return DropdownMenuItem<String>(
                value: lang['code'],
                child: Text(lang['name']!), // Display language name
              );
            }).toList(),
            onChanged: (String? newLang) {
              if (newLang != null) {
                widget.splashCubit.systemSettings(newLang);
                setState(() {
                  widget.dataSources.currentLang =
                      newLang; // Update the local state immediately
                });
              }
            },
          )),
        ],
      ),
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
                        TranslationHelper.tr(widget.dataSources.state, 'email'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      AppTextFormField.textFormField(
                        controller: _phoneController,
                        context: context,
                        titleText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_email'),
                        hintText: TranslationHelper.tr(widget.dataSources.state, 'enter_your_email'),
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
                      // TextField(
                      //   controller: _passwordController,
                      //   obscureText: _obscurePassword,
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter your password',
                      //     hintStyle: TextStyle(color: Colors.grey[400]),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //       borderSide: BorderSide(color: Colors.grey[300]!),
                      //     ),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         _obscurePassword
                      //             ? Icons.visibility_off
                      //             : Icons.visibility,
                      //         color: Colors.grey,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           _obscurePassword = !_obscurePassword;
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      AppTextFormField.textFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        context: context,
                        titleText: TranslationHelper.tr(widget.dataSources.state, 'password'),
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
                        state as LoginState;
                        return AppButton.getButton(
                            loading: state.isLoading,
                            child: Text(TranslationHelper.tr(widget.dataSources.state, 'login')),
                            onPressed: () => cubit.login(
                                body: LoginModel(
                                        email: _phoneController.text,
                                        password: _passwordController.text)
                                    .toJson()));
                      }),
                  24.verticalSpace,
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(TranslationHelper.tr(widget.dataSources.state, 'dont_have_an_account')),
                      TextButton(
                        onPressed: () => cubit.goSignUpPage(),
                        child: Text(
                          TranslationHelper.tr(widget.dataSources.state, 'sign_up'),
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
