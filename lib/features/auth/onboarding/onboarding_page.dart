import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/features/auth/onboarding/widget/dot_indicator.dart';
import 'package:flutter_template/features/auth/onboarding/widget/onboard_content.dart';
import 'onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingCubit cubit;
  final SplashDataSources dataSources;

  const OnboardingPage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  OnboardingCubit get cubit => widget.cubit;
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.dataSources.state['data'];
    List<Map<String, dynamic>> demoData = [
      {
        "illustration": info['app_onboarding_image_1'],
        "title": info['app_onboarding_title_1'],
        "text": info['app_onboarding_subtitle_1'],
      },
      {
        "illustration": info['app_onboarding_image_2'],
        "title": info['app_onboarding_title_2'],
        "text": info['app_onboarding_subtitle_2'],
      },
      {
        "illustration": info['app_onboarding_image_3'],
        "title": info['app_onboarding_title_3'],
        "text": info['app_onboarding_subtitle_3'],
      },
    ];

    void nextPage() {
      if (currentPage < demoData.length - 1) {
        setState(() {
          currentPage++;
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    }

    void previousPage() {
      if (currentPage > 0) {
        setState(() {
          currentPage--;
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 14,
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: demoData[index]["illustration"],
                  title: demoData[index]["title"],
                  text: demoData[index]["text"],
                  cubit: cubit,
                ),
              ),
            ),
            const Spacer(),
            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            const Spacer(flex: 2),
            // Previous, Next Buttons
            currentPage == demoData.length - 1
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: AppButton.getButton(
                        color: Colors.green,
                        child: const Text('Get Start',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => cubit.goToLogin()),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage == 0)
                          const SizedBox()
                        else
                          ElevatedButton(
                              onPressed: previousPage,
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 14.h),
                                  // backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              child: const Icon(Icons.arrow_back)
                              // currentPage == demoData.length - 1 ? "Finish" : "Next",
                              ) // else
                        , //   _previousPage,
                        // Next Button (disable if last page)
                        ElevatedButton(
                            onPressed: currentPage == demoData.length - 1
                                ? () => cubit.goToLogin()
                                : nextPage,
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 14.h),
                                // backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                minimumSize: Size.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r))),
                            child: const Icon(Icons.arrow_forward)
                            // currentPage == demoData.length - 1 ? "Finish" : "Next",
                            ),
                      ],
                    ),
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
