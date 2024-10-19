import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/features/setting/setting_page.dart';
import 'faq_cubit.dart';
import 'faq_state.dart';
import 'faq_state.dart';
import '/core/status_switcher.dart';

import '/domain/entities/faq/mock_faq_model.dart';

class FaqPage extends StatefulWidget {
  final FaqCubit cubit;

  const FaqPage({
    super.key,
    required this.cubit,
  });

  @override
  State<FaqPage> createState() => _FaqState();
}

class _FaqState extends State<FaqPage> {
  FaqCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('FAQS'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(35.r),
            child: Text(
              'We’re here to help you with anything and everyting on ViralPitch',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: const Text('FAQS',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )),
          const Divider(),
          faqsData(),
          faqsData(),
          10.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text(
                    'Still stuck? Help us a mail away',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppButton.getButton(
                      child: const Text('Send a message',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                      color: Colors.redAccent.shade200)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

faqsData() {
  return Column(
    children: [
      ListTile(
        minTileHeight: 0,
        contentPadding: EdgeInsets.only(left: 35.w),
        onTap: () {},
        title: const Text('What is Viral Pitch?'),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      ),
      const Divider()
    ],
  );
}
