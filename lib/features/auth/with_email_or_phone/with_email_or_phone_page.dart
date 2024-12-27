import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/features/auth/onboarding/onboarding_page.dart';
import 'with_email_or_phone_cubit.dart';
import 'with_email_or_phone_state.dart';
import 'package:flutter_template/config/translation_helper.dart';
import 'with_email_or_phone_state.dart';
import '../../../config/status_switcher.dart';

class WithEmailOrPhonePage extends StatefulWidget {
  final WithEmailOrPhoneCubit cubit;
  final AppDataSources dataSources;

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
                      child: Text(TranslationHelper.tr(widget.dataSources.state, 'login_with_email')),
                      onPressed: () => cubit.goLoginWithEmail()),
                  20.verticalSpace,
                  AppButton.getButton(
                      child: Text(TranslationHelper.tr(widget.dataSources.state, 'login_with_phone')),
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
