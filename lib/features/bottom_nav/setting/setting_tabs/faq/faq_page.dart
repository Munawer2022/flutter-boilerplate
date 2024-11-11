import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/status_switcher.dart';
import 'package:flutter_template/data/models/bottom_nav/setting/setting_tabs/faq/faq_model.dart';
import 'faq_cubit.dart';
import 'faq_state.dart';
import 'faq_state.dart';

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
    cubit.faq();
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
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          state as FaqState;
          return StatusSwitcher<FaqModel>(
            response: state.response,
            onLoading: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            onCompleted: (context, data) => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(35.r),
                    child: Text(
                      'We re here to help you with anything and everything',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ...data.data
                      .map((faq) => ExpansionTile(
                            title: Text(faq.question),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(16.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(faq.answer),
                                      if (faq.image != null &&
                                          faq.image!.isNotEmpty) ...[
                                        16.verticalSpace,
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.network(
                                            faq.image!,
                                            width: double.infinity,
                                            height: 200.h,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const SizedBox.shrink(),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        Text(
                          'Still stuck? Help us a mail away',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        10.verticalSpace,
                        AppButton.getButton(
                            child: const Text('Send a message',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {},
                            color: Colors.redAccent.shade200)
                      ],
                    ),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
