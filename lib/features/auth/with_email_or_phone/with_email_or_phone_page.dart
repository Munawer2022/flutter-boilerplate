import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/features/auth/onboarding/onboarding_page.dart';
import 'with_email_or_phone_cubit.dart';
import 'with_email_or_phone_state.dart';
import 'with_email_or_phone_state.dart';
import '../../../config/status_switcher.dart';

class WithEmailOrPhonePage extends StatefulWidget {
  final WithEmailOrPhoneCubit cubit;
  final SplashDataSources dataSources;

  const WithEmailOrPhonePage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<WithEmailOrPhonePage> createState() => _WithEmailOrPhoneState();
}

class _WithEmailOrPhoneState extends State<WithEmailOrPhonePage> {
  WithEmailOrPhoneCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataSources.state;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.network(
                  data['data']['app_logo'],
                  height: 80,
                ),
              ),
              Column(
                children: [
                  AppButton.getButton(
                      child: const Text('Login With Email'),
                      onPressed: () => cubit.goLoginWithEmail()),
                  20.verticalSpace,
                  AppButton.getButton(
                      child: const Text('Login With Phone'),
                      onPressed: () => cubit.goLoginWithPhone())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
